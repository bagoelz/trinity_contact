import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/model/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/view/contact/contactList.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ContactModel> getContactByCapital(
        List<ContactModel> allcontacts, String capitalLetter) {
      return allcontacts
          .where((item) =>
              item.firstName[0].toLowerCase() == capitalLetter.toLowerCase())
          .toList();
    }

    return GetBuilder<ContactController>(
        init: ContactController.to.getData(),
        builder: (controller) {
          return RefreshIndicator(
              onRefresh: () => controller.loadData(),
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      decoration: BoxDecoration(
                          color: View.of(context)
                                      .platformDispatcher
                                      .platformBrightness ==
                                  Brightness.dark
                              ? Theme.of(context).canvasColor
                              : CustomizeTheme.whiteColor,
                          boxShadow: const [
                            BoxShadow(
                              color: CustomizeTheme.lightGrayColor,
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                              blurRadius: 5.0,
                            )
                          ]),
                      child: AppBar(
                        backgroundColor: View.of(context)
                                    .platformDispatcher
                                    .platformBrightness ==
                                Brightness.dark
                            ? Theme.of(context).canvasColor
                            : CustomizeTheme.whiteColor,
                        title: Text(
                          'My Contacts',
                          style: context.titleLarge?.copyWith(
                              color: View.of(context)
                                          .platformDispatcher
                                          .platformBrightness ==
                                      Brightness.dark
                                  ? CustomizeTheme.whiteColor
                                  : CustomizeTheme.blackColor,
                              fontSize: 23,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SearchInput(
                            textController: controller.searchText,
                          ),
                          SizedBox(
                            height: Get.height - 223,
                            child: ListView(
                              children: List.generate(
                                  controller.collectCapital.length, (index) {
                                String capitalLetter =
                                    controller.collectCapital[index];
                                List<ContactModel> contacts =
                                    getContactByCapital(
                                        controller.contactList, capitalLetter);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      capitalLetter.toUpperCase(),
                                      style: context.titleLarge?.copyWith(
                                          color: CustomizeTheme.blueColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Divider(
                                      thickness: 0.3,
                                      color: View.of(context)
                                                  .platformDispatcher
                                                  .platformBrightness ==
                                              Brightness.dark
                                          ? CustomizeTheme.whiteColor
                                          : CustomizeTheme.lightGrayColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ContactList(
                                      contacts: contacts,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
        });
  }
}
