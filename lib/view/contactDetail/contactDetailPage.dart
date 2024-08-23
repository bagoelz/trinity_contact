import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Auth.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/view/contactDetail/formDetail.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(builder: (controller) {
      return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(kToolbarHeight),
        //   child: Container(
        //     decoration: const BoxDecoration(boxShadow: [
        //       BoxShadow(
        //         color: CustomizeTheme.lightGrayColor,
        //         offset: Offset(0, 0),
        //         spreadRadius: 1,
        //         blurRadius: 5.0,
        //       )
        //     ]),
        //     child: AppBar(
        //       leading: IconButton(
        //           onPressed: () => Get.back(),
        //           icon: const Icon(
        //             Icons.chevron_left_rounded,
        //             color: CustomizeTheme.blackColor,
        //             size: 40,
        //           )),
        //       backgroundColor: CustomizeTheme.whiteColor,
        //       title: Text(
        //         'Contact Detail',
        //         style: context.titleLarge?.copyWith(
        //             color: CustomizeTheme.blackColor,
        //             fontSize: 23,
        //             fontWeight: FontWeight.w700),
        //       ),
        //     ),
        //   ),
        // ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     AvatarCircle(avatarText: avatarText),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              const SectionInformation(
                title: 'Main information',
              ),
              const SizedBox(
                height: 10,
              ),
              const LabelDisplay(firstText: 'First Name', secondText: '*'),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                height: 40,
                child: FormInputFieldWithIcon(
                  controller: controller.firstName,
                  suffixIsAsset: true,
                  iconPrefix: const Icon(
                    Icons.person_outlined,
                    color: CustomizeTheme.blueColor,
                  ),
                  hintText: 'Enter first name',
                  textColor: CustomizeTheme.blackColor,
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          // child: FormDetail(
          //   avatarText:
          //       controller.getFirstCapital(controller.selectedContact.value!),
          // ),
        ),
      );
    });
  }
}
