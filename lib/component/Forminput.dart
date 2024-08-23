import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trinity_contact/shared/extension.dart';
import 'package:trinity_contact/shared/validator.dart';
import 'package:intl/intl.dart';

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
          context.bodySmall?.copyWith(fontWeight: FontWeight.w100),
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
        Expanded(
          child: SizedBox(
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
                  ? context.bodySmall
                      ?.copyWith(color: textColor, fontWeight: FontWeight.w100)
                  : context.bodySmall?.copyWith(fontWeight: FontWeight.w100),
              readOnly: readOnly,
              enabled: enabled,
              controller: controller,
              onSaved: onSaved,
              onChanged: onChanged,
              keyboardType: keyboardType,
              obscureText: obscureText,
              validator: validateFunction,
              focusNode: focusNode,
              maxLines: maxLines,
              minLines: minLines,
            ),
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

class TextFieldTanggal extends StatelessWidget {
  final String label;
  final double? width;
  final TextEditingController controller;
  final TextEditingController? tglVar;
  final String? Function(String?)? validate;
  const TextFieldTanggal(
      {super.key,
      required this.label,
      required this.controller,
      this.validate,
      this.width,
      this.tglVar});

  @override
  Widget build(BuildContext context) {
    final validate = Validator();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        key: const Key('members'),
                        content: SizedBox(
                          width: 300,
                          height: 400,
                          child: DatePickerDialog(
                            restorationId: 'date_picker_dialog',
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialDate: DateTime.fromMillisecondsSinceEpoch(
                                DateTime.now().millisecondsSinceEpoch),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2022),
                            onDatePickerModeChange: (value) {
                              print(value.toString());
                              // controller.text = DateFormat('dd, MMMM yyyy')
                              //     .format(
                              //         DateTime.parse(args.value.toString()));
                            },
                          ),
                          // child: SfDateRangePicker(
                          //   view: DateRangePickerView.month,
                          //   allowViewNavigation: true,
                          //   showNavigationArrow: true,
                          //   enableMultiView: false,
                          //   selectionMode: DateRangePickerSelectionMode.single,
                          //   onSelectionChanged: (args) {
                          // controller.text = DateFormat('dd, MMMM yyyy')
                          //     .format(
                          //         DateTime.parse(args.value.toString()));
                          //     tglVar.text =
                          //         DateTime.parse(args.value.toString())
                          //             .millisecondsSinceEpoch
                          //             .toString();
                          //   },
                          //   showActionButtons: true,
                          //   onCancel: () => Get.back(),
                          //   onSubmit: (val) => Get.back(),
                          // ),
                        ));
                  });
            },
            child: width != null
                ? SizedBox(
                    width: width,
                    child: FormInputField(
                      controller: controller,
                      hintText: label,
                      readOnly: true,
                      enabled: true,
                      validateFunction: validate.validateText,
                    ),
                  )
                : FormInputField(
                    controller: controller,
                    hintText: label,
                    readOnly: true,
                    enabled: true,
                    validateFunction: validate.validateText,
                  ),
          ),
        ],
      ),
    );
  }
}
