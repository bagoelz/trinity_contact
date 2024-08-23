import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/model/Contact.dart';

class ContactController extends GetxController {
  static ContactController get to => Get.find();
  final formKey = GlobalKey<FormState>();
  TextEditingController searchText = TextEditingController();
  final contactTempList = RxList<ContactModel>();
  final contactList = RxList<ContactModel>();
  final collectCapital = RxList<String>([]);
  final selectedContact = Rxn<ContactModel>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();

  getData() async {
    //make sure no data before data load
    contactTempList.value = <ContactModel>[];
    //load contact from assets
    final data =
        jsonDecode(await rootBundle.loadString("assets/datajson/data.json"));

    await Future.forEach(data, (item) {
      contactTempList.add(ContactModel.map(item));
    });

    contactList.addAll(contactTempList);
    //sort contact a to z
    contactList.sort((a, b) => a.firstName.compareTo(b.firstName));
    update();

    //collect first capital of contact
    getAllCapital();
  }

  getAllCapital() {
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
    print(searchText.text.toString());
  }

  selectContact(ContactModel contact) {
    selectedContact.value = contact;
    selectedContact.refresh();
    firstName.text = selectedContact.value!.firstName;
    lastName.text = selectedContact.value!.lastName;
    email.text = selectedContact.value!.email!;
    dob.text = selectedContact.value!.dob!;
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
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
