import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/component/Component.dart';
import 'package:trinity_contact/controller/Contact.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/validator.dart';

class SearchInput extends GetView<ContactController> {
  final TextEditingController textController;
  const SearchInput({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return FormInputFieldWithIcon(
      controller: textController,
      suffixIsAsset: true,
      imageSuffix: controller.searchOn.value
          ? Image.asset('assets/icon/search_active.png')
          : Image.asset('assets/icon/search.png'),
      hintText: 'Search your contact list...',
      textColor: CustomizeTheme.blackColor,
      validateFunction: Validator().validateText,
      keyboardType: TextInputType.text,
      onChanged: (val) => controller.searchContact(),
    );
  }
}
