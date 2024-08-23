import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/view/contactDetail/formDetail.dart';

import '../../component/Component.dart';

class AddContactPage extends GetView<ContactController> {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
              color: View.of(context).platformDispatcher.platformBrightness ==
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
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color:
                      View.of(context).platformDispatcher.platformBrightness ==
                              Brightness.dark
                          ? CustomizeTheme.whiteColor
                          : CustomizeTheme.blackColor,
                  size: 40,
                )),
            backgroundColor:
                View.of(context).platformDispatcher.platformBrightness ==
                        Brightness.dark
                    ? Theme.of(context).canvasColor
                    : CustomizeTheme.whiteColor,
            title: Text(
              'Contact Detail',
              style: context.titleLarge?.copyWith(
                  color:
                      View.of(context).platformDispatcher.platformBrightness ==
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
                height: 30,
              ),
              const Center(
                child: AvatarCircle(
                  showBorder: false,
                  width: 100,
                  height: 100,
                  circular: 50,
                  textSize: 40,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SectionInformation(
                title: 'Main information',
              ),
              SizedBox(
                height: Get.height - 301,
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      FormDetail(
                        firstName: controller.firstName,
                        lastName: controller.lastName,
                        email: controller.email,
                        dob: controller.dob,
                        readOnly: false,
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      RoundedButton(
                          label: "Save",
                          textStyle: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomizeTheme.blueColor,
                          ),
                          borderColor: Colors.transparent,
                          color: CustomizeTheme.blueColor.withOpacity(0.2),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.addNewContact();
                            }
                          }),
                      const SizedBox(
                        height: 130,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
