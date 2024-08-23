import 'package:flutter/material.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';

class LabelDisplay extends StatelessWidget {
  final String firstText;
  final String secondText;
  const LabelDisplay(
      {super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style:
              context.titleMedium?.copyWith(color: CustomizeTheme.blackColor),
        ),
        Text(
          secondText,
          style: context.bodySmall?.copyWith(color: CustomizeTheme.redColor),
        ),
      ],
    );
  }
}
