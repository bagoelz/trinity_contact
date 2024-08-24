import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Auth.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/view/profile/BioDetail.dart';

class ProfilePage extends GetView<ContactController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            backgroundColor:
                View.of(context).platformDispatcher.platformBrightness ==
                        Brightness.dark
                    ? Theme.of(context).canvasColor
                    : CustomizeTheme.whiteColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Profile',
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
                GetBuilder<AuthenticationController>(builder: (auth) {
                  return InkWell(
                    onTap: () => auth.handledSignout(),
                    child: Text(
                      'Logout',
                      style: context.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CustomizeTheme.blueColor),
                    ),
                  );
                }),
              ],
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
                    avatarText: controller
                        .getFirstCapital(controller.ownContact.value!),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BioDetail(contact: controller.ownContact.value!),
                const SizedBox(
                  height: 30,
                ),
                RoundedButton(
                    label: "Update my detail",
                    textStyle: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CustomizeTheme.blueColor,
                    ),
                    borderColor: Colors.transparent,
                    color: CustomizeTheme.blueColor.withOpacity(0.2),
                    onPressed: () {
                      controller.selectContact(controller.ownContact.value!);
                      Get.toNamed('/contactdetail');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
