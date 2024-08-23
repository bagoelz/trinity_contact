import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/model/Contact.dart';
import 'package:uuid/uuid.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find();
  final formKey = GlobalKey<FormState>();
  TextEditingController searchText = TextEditingController();
  final contactTempList = RxList<ContactModel>();
  final contactList = RxList<ContactModel>();
  final collectCapital = RxList<String>([]);
  final selectedIndex = RxnInt(0);
  final ownContact = Rxn<ContactModel>();
  final selectedContact = Rxn<ContactModel>();
  final searchOn = RxBool(false);
  final uuid = const Uuid();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();

  getData() {
    loadData();
  }

  loadData() async {
    //make sure no data before data load
    contactList.value = <ContactModel>[];
    //load contact from assets
    final data =
        jsonDecode(await rootBundle.loadString("assets/datajson/data.json"));

    await Future.forEach(data, (item) {
      contactList.add(ContactModel.map(item));
    });

    update();

    //collect first capital of contact
    getAllCapital(changeOwn: true);
  }

  getAllCapital({bool changeOwn = false}) {
    //sort contact a to z
    contactList.sort((a, b) => a.firstName.compareTo(b.firstName));
    if (changeOwn) {
      ownContact.value = contactList[0];
    }
    update();
    collectCapital.value = [];
    for (var item in contactList) {
      String capital = item.firstName[0];
      int capitalLength = collectCapital.length;
      if (capitalLength == 0) {
        collectCapital.add(item.firstName[0]);
      } else if (capitalLength > 0 &&
          item.firstName.isNotEmpty &&
          collectCapital[capitalLength - 1] != capital) {
        collectCapital.add(capital);
        collectCapital.refresh();
      }
      update();
    }
  }

  searchContact() {
    String text = searchText.text.toLowerCase();
    if (text.length > 3) {
      searchOn.value = true;
      searchOn.refresh();
      contactList.value = contactList
          .where((item) =>
              item.firstName.toLowerCase().contains(text) ||
              item.lastName.toLowerCase().contains(text))
          .toList();
      contactList.refresh();
      getAllCapital(changeOwn: false);
      update();
    } else {
      searchOn.value = false;
      searchOn.refresh();
      loadData();
    }
  }

  selectContact(ContactModel contact) {
    selectedContact.value = contact;
    firstName.text = contact.firstName;
    lastName.text = contact.lastName;
    email.text = contact.email ?? "";
    dob.text = contact.dob ?? "";
    phone.text = contact.phoneNumber.toString();
    update();
  }

  clearDetailController() {
    firstName.text = "";
    lastName.text = "";
    email.text = "";
    dob.text = "";
    phone.text = "";
  }

  updateDetail() {
    int index =
        contactList.indexWhere((item) => item.id == selectedContact.value!.id);
    contactList[index].firstName = firstName.text;
    contactList[index].lastName = lastName.text;
    contactList[index].email = email.text;
    contactList[index].dob = dob.text;
    contactList[index].phoneNumber = int.parse(phone.text);
    contactList.refresh();
    clearDetailController();
    selectedContact.value =
        ContactModel(id: '', firstName: 'firstName', lastName: 'lastName');
    ownContact.refresh();
    getAllCapital();
    update();
    Get.back();
  }

  addNewContact() {
    String id = uuid.v1();
    contactList.add(ContactModel(
      id: id,
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      dob: dob.text,
      phoneNumber: int.parse(phone.text),
    ));
    contactList.refresh();
    getAllCapital();
    Get.back();
  }

  removeContact() {
    int index =
        contactList.indexWhere((item) => item.id == selectedContact.value!.id);
    contactList.removeAt(index);
    contactList.refresh();
    getAllCapital();
    update();
    Get.back();
  }

  String getFullName(ContactModel contact) {
    return "${contact.firstName} ${contact.lastName}";
  }

  String getFirstCapital(ContactModel contact) {
    return "${contact.firstName[0].toString()}${contact.lastName[0].toString()}";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    contactList.value = <ContactModel>[];
    contactTempList.value = <ContactModel>[];
    super.onClose();
  }
}
