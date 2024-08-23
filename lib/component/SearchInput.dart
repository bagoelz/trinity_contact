import 'package:flutter/material.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/validator.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final GestureTapCallback onTap;
  const SearchInput({super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FormInputFieldWithIcon(
      controller: controller,
      suffixIsAsset: true,
      imageSuffix: Image.asset('assets/icon/search.png'),
      hintText: 'Search your contact list...',
      textColor: CustomizeTheme.blackColor,
      validateFunction: Validator().validateText,
      keyboardType: TextInputType.text,
      onIconTap: onTap,
    );
  }
}
