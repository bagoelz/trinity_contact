import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/validator.dart';

class FormDetail extends GetView<ContactController> {
  final String avatarText;
  const FormDetail({super.key, required this.avatarText});

  @override
  Widget build(BuildContext context) {
    final validate = Validator();
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarCircle(avatarText: avatarText),
            ],
          ),
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
          FormInputFieldWithIcon(
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
          // const LabelDisplay(firstText: 'Last Name', secondText: '*'),
          // const SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   color: Colors.black,
          //   height: 40,
          //   width: Get.width,
          //   child: FormInputFieldWithIcon(
          //     controller: controller.lastName,
          //     suffixIsAsset: true,
          //     iconPrefix: const Icon(
          //       Icons.person_outlined,
          //       color: CustomizeTheme.blueColor,
          //     ),
          //     hintText: 'Enter last name',
          //     textColor: CustomizeTheme.blackColor,
          //     validateFunction: Validator().validateText,
          //     keyboardType: TextInputType.text,
          //   ),
          // ),
          // const SectionInformation(
          //   title: 'Sub information',
          // ),
          // const LabelDisplay(firstText: 'Email', secondText: '*'),
          // FormInputFieldWithIcon(
          //   controller: firstName,
          //   suffixIsAsset: true,
          //   iconPrefix: const Icon(
          //     Icons.person_outlined,
          //     color: CustomizeTheme.blueColor,
          //   ),
          //   hintText: 'Email',
          //   textColor: CustomizeTheme.blackColor,
          //   validateFunction: validate.validateEmail,
          //   keyboardType: TextInputType.text,
          // ),
          // const LabelDisplay(firstText: 'Email', secondText: '*'),
          // TextFieldTanggal(
          //   label: 'Enter birth date',
          //   controller: dob,
          // )
          // FormInputFieldWithIcon(
          //   controller: firstName,
          //   suffixIsAsset: true,
          //   iconPrefix: const Icon(
          //     Icons.person_outlined,
          //     color: CustomizeTheme.blueColor,
          //   ),
          //   hintText: 'Date of birth',
          //   textColor: CustomizeTheme.blackColor,
          //   validateFunction: validate.validateTextEmpty,
          //   keyboardType: TextInputType.text,
          // ),
        ],
      ),
    );
  }
}
