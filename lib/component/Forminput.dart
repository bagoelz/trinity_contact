import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/shared/extension.dart';

class FormInputField extends StatelessWidget {
  FormInputField(
      {this.controller,
      this.labelText,
      this.hintText,
      this.suffix,
      this.validateFunction,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.inputFormatters,
      this.textInputStyle,
      this.minLines = 1,
      this.onEditingComplete,
      this.maxline = 1,
      this.onChanged,
      this.maxLength,
      this.onTap,
      this.readOnly = false,
      this.focusNode,
      this.enabled = false,
      this.inputDecoration,
      this.onSaved});

  final TextEditingController? controller;
  final String? labelText, hintText;
  final String? Function(String?)? validateFunction;
  final TextInputType keyboardType;
  final TextStyle? textInputStyle;
  final bool obscureText;
  final FocusNode? focusNode;
  final int minLines;
  final int maxline;
  final Icon? suffix;
  final bool readOnly, enabled;
  final GestureTapCallback? onTap;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final InputDecoration? inputDecoration;
  final String isiText = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      style: textInputStyle ??
          context.bodySmall?.copyWith(
            fontWeight: FontWeight.w100,
          ),
      decoration: inputDecoration ??
          InputDecoration(
              //filled: true,
              hintText: hintText,
              alignLabelWithHint: true,
              labelText: labelText,
              suffixIcon: suffix != null ? suffix : null),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      onTap: () => onTap,
      maxLength: maxLength,
      enabled: !enabled,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxline,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.top,
      minLines: minLines,
      validator: validateFunction,
      readOnly: readOnly,
    );
  }
}

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon(
      {this.controller,
      this.iconPrefix,
      this.iconSuffix,
      this.labelText,
      this.hintText,
      this.enabled = true,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.minLines = 1,
      this.maxLines = 1,
      this.onIconTap,
      this.iconAdded,
      this.onChanged,
      this.validateFunction,
      this.focusNode,
      this.onEditingComplete,
      this.inputDecoration,
      this.onFieldSubmitted,
      this.prefixIsAsset = false,
      this.suffixIsAsset = false,
      this.imagePrefix,
      this.imageSuffix,
      this.textColor,
      this.onSaved});

  final TextEditingController? controller;
  final Icon? iconPrefix;
  final Icon? iconSuffix;
  final Image? imagePrefix;
  final Image? imageSuffix;
  final bool? suffixIsAsset;
  final bool? prefixIsAsset;
  final String? labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validateFunction;
  final Icon? iconAdded;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final GestureTapCallback? onIconTap;
  final void Function(String?)? onSaved;
  final InputDecoration? inputDecoration;
  final bool readOnly, enabled;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Get.width - 40,
          child: TextFormField(
            decoration: inputDecoration ??
                InputDecoration(
                  //filled: true,
                  labelStyle: textColor != null
                      ? context.bodySmall?.copyWith(
                          color: textColor, fontWeight: FontWeight.w100)
                      : context.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w100),

                  labelText: labelText,
                  hintText: hintText,
                  prefixIcon: prefixIsAsset == true
                      ? InkWell(onTap: onIconTap, child: imagePrefix)
                      : iconPrefix == null
                          ? null
                          : IconButton(
                              onPressed: onIconTap,
                              icon: SizedBox(
                                child: iconPrefix,
                              )),
                  suffixIcon: suffixIsAsset == true
                      ? InkWell(onTap: onIconTap, child: imageSuffix)
                      : iconSuffix == null
                          ? null
                          : IconButton(
                              onPressed: onIconTap,
                              icon: SizedBox(
                                child: iconSuffix,
                              )),
                ),
            style: textColor != null
                ? context.bodySmall?.copyWith(color: textColor)
                : context.bodySmall,
            readOnly: readOnly,
            enabled: enabled,
            controller: controller,
            onSaved: onSaved,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validateFunction,
            textInputAction: TextInputAction.next,
            focusNode: focusNode,
            maxLines: maxLines,
            minLines: minLines,
          ),
        ),
        iconAdded != null
            ? IconButton(
                onPressed: onIconTap,
                icon: SizedBox(
                  child: iconAdded,
                ))
            : SizedBox()
      ],
    );
  }
}
