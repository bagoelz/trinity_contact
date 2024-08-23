import 'package:flutter/material.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';

class SectionInformation extends StatelessWidget {
  final String title;
  const SectionInformation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.bodySmall?.copyWith(
              color: CustomizeTheme.blueColor,
              fontStyle: FontStyle.italic,
              fontSize: 15),
        ),
        const Divider(
          thickness: 0.3,
        ),
      ],
    );
  }
}
