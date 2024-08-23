import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/view/contactDetail/formDetail.dart';

class ContactDetailPage extends GetView<ContactController> {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) {
        controller.clearDetailController();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
                color: View.of(context).platformDispatcher.platformBrightness ==
                        Brightness.dark
                    ? Colors.transparent
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
                    color: View.of(context)
                                .platformDispatcher
                                .platformBrightness ==
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
        body: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: AvatarCircle(
                        showBorder: false,
                        width: 100,
                        height: 100,
                        circular: 50,
                        textSize: 40,
                        avatarText: controller.getFirstCapital(
                            controller.selectedContact.value!)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SectionInformation(
                    title: 'Main information',
                  ),
                  SizedBox(
                      height: Get.height - 301,
                      child: ListView(
                        children: [
                          FormDetail(
                            firstName: controller.firstName,
                            lastName: controller.lastName,
                            phone: controller.phone,
                            email: controller.email,
                            dob: controller.dob,
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                          RoundedButton(
                            label: "Update",
                            textStyle: context.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: CustomizeTheme.blueColor,
                            ),
                            borderColor: Colors.transparent,
                            color: CustomizeTheme.blueColor.withOpacity(0.2),
                            onPressed: () => controller.updateDetail(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RoundedButton(
                              label: "Remove",
                              textStyle: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: CustomizeTheme.removeTitle,
                              ),
                              borderColor: CustomizeTheme.redColor,
                              color: Colors.transparent,
                              onPressed: () => controller.removeContact()),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
