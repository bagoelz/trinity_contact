import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/component/Label.dart';
import 'package:trinity_contact/controller/Controller.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/shared/validator.dart';

class SignInPage extends GetView<AuthenticationController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final validate = Validator();
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.formKeySign,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Hi There !',
                    style: context.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: CustomizeTheme.blueColor),
                  ),
                  Text(
                    'Please login to see your contact list',
                    style: context.bodySmall?.copyWith(
                      color: CustomizeTheme.superGrayColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const LabelDisplay(firstText: 'User ID', secondText: '*'),
                  const SizedBox(
                    height: 10,
                  ),
                  FormInputFieldWithIcon(
                    controller: controller.credentials,
                    iconPrefix: const Icon(
                      Icons.person_outlined,
                      color: CustomizeTheme.blueColor,
                    ),
                    hintText: 'Please fill your user id',
                    textColor: CustomizeTheme.blackColor,
                    validateFunction: validate.validateText,
                    keyboardType: TextInputType.text,
                    onChanged: (val) => controller.allowed,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RoundedButton(
                      label: "Login",
                      textStyle: context.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: CustomizeTheme.blueColor,
                      ),
                      borderColor: Colors.transparent,
                      color: controller.allowedLogin.value
                          ? CustomizeTheme.blueColor.withOpacity(0.9)
                          : CustomizeTheme.blueColor.withOpacity(0.2),
                      onPressed: () async {
                        if (controller.formKeySign.currentState!.validate()) {
                          controller.handledLogin();
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
