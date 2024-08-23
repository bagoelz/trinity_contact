import 'package:flutter/material.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/extension.dart';

class AvatarCircle extends StatelessWidget {
  final String? avatarText;
  final double? height, width, circular, textSize;
  final bool? showBorder;
  const AvatarCircle(
      {super.key,
      this.avatarText,
      this.height,
      this.width,
      this.showBorder = true,
      this.circular,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 45,
      height: height ?? 45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circular ?? 23),
          color: CustomizeTheme.blueColor,
          border: Border.all(
              color: showBorder == true
                  ? CustomizeTheme.darkGrayColor
                  : Colors.transparent,
              width: 1)),
      child: Center(
        child: avatarText != null
            ? Text(
                avatarText!,
                textAlign: TextAlign.center,
                style: context.bodyLarge?.copyWith(
                    color: CustomizeTheme.whiteColor,
                    fontSize: textSize ?? 14,
                    fontWeight: FontWeight.w300),
              )
            : const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 60,
              ),
      ),
    );
  }
}
