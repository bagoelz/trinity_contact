import 'package:flutter/material.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';

class TextBio extends StatelessWidget {
  final String title;
  final Color? color;
  const TextBio({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.bodyMedium?.copyWith(
          fontSize: 14,
          color: color != null
              ? View.of(context).platformDispatcher.platformBrightness ==
                      Brightness.dark
                  ? CustomizeTheme.whiteColor
                  : CustomizeTheme.contactTitel.withOpacity(0.6)
              : color),
    );
  }
}
