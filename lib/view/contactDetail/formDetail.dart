import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/validator.dart';

class FormDetail extends GetView<ContactController> {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController dob;
  final bool readOnly;
  const FormDetail({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.dob,
    this.readOnly = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final validate = Validator();
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const LabelDisplay(firstText: 'First Name', secondText: '*'),
        const SizedBox(
          height: 10,
        ),
        FormInputFieldWithIcon(
          controller: firstName,
          suffixIsAsset: false,
          readOnly: readOnly,
          iconPrefix: const Icon(
            Icons.person_outlined,
            color: CustomizeTheme.blueColor,
          ),
          hintText: 'Enter first name..',
          textColor: View.of(context).platformDispatcher.platformBrightness ==
                  Brightness.dark
              ? CustomizeTheme.whiteColor
              : CustomizeTheme.blackColor,
          validateFunction: Validator().validateText,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 30,
        ),
        const LabelDisplay(firstText: 'Last Name', secondText: '*'),
        const SizedBox(
          height: 10,
        ),
        FormInputFieldWithIcon(
          controller: lastName,
          suffixIsAsset: false,
          readOnly: readOnly,
          iconPrefix: const Icon(
            Icons.person_outlined,
            color: CustomizeTheme.blueColor,
          ),
          hintText: 'Enter last name..',
          textColor: View.of(context).platformDispatcher.platformBrightness ==
                  Brightness.dark
              ? CustomizeTheme.whiteColor
              : CustomizeTheme.blackColor,
          validateFunction: Validator().validateText,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 30,
        ),
        const LabelDisplay(firstText: 'Phone number', secondText: '*'),
        const SizedBox(
          height: 10,
        ),
        FormInputFieldWithIcon(
          controller: phone,
          suffixIsAsset: false,
          readOnly: readOnly,
          iconPrefix: const Icon(
            Icons.add,
            size: 15,
            color: CustomizeTheme.blueColor,
          ),
          hintText: 'Enter phone number (ex: 60xxxxxxxxx)..',
          textColor: View.of(context).platformDispatcher.platformBrightness ==
                  Brightness.dark
              ? CustomizeTheme.whiteColor
              : CustomizeTheme.blackColor,
          validateFunction: Validator().validateNumber,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 40,
        ),
        const SectionInformation(
          title: 'Sub information',
        ),
        const SizedBox(
          height: 10,
        ),
        const LabelDisplay(firstText: 'Email', secondText: ''),
        const SizedBox(
          height: 10,
        ),
        FormInputFieldWithIcon(
          controller: email,
          suffixIsAsset: false,
          readOnly: readOnly,
          iconPrefix: const Icon(
            Icons.email_outlined,
            color: CustomizeTheme.blueColor,
          ),
          hintText: 'Enter email..',
          textColor: View.of(context).platformDispatcher.platformBrightness ==
                  Brightness.dark
              ? CustomizeTheme.whiteColor
              : CustomizeTheme.blackColor,
          validateFunction: validate.validateEmail,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 30,
        ),
        const LabelDisplay(firstText: 'Date of Birth', secondText: ''),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            DateTime? _picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(DateTime.now().year + 1));
            if (_picked != null) {
              dob.text = DateFormat("dd/MM/yyyy").format(_picked);
            }
          },
          child: FormInputFieldWithIcon(
            controller: dob,
            suffixIsAsset: false,
            readOnly: true,
            enabled: false,
            iconPrefix: const Icon(
              Icons.email_outlined,
              color: CustomizeTheme.blueColor,
            ),
            hintText: 'Enter birthday..',
            textColor: View.of(context).platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? CustomizeTheme.whiteColor
                : CustomizeTheme.blackColor,
            validateFunction: validate.validateBirthDay,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
