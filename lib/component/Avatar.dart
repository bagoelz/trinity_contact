import 'package:flutter/material.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';

class AvatarCircle extends StatelessWidget {
  final String avatarText;
  final double? height, width, circular, textSize;
  const AvatarCircle(
      {super.key,
      required this.avatarText,
      this.height,
      this.width,
      this.circular,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular ?? 25),
          color: CustomizeTheme.blueColor,
          border: Border.all(color: CustomizeTheme.darkGrayColor, width: 1)),
      child: Center(
        child: Text(
          avatarText,
          textAlign: TextAlign.center,
          style: context.bodyLarge?.copyWith(
              color: CustomizeTheme.whiteColor,
              fontSize: textSize ?? 20,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
