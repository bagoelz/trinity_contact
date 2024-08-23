import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? label;
  final String? tooltipMessage;
  final Widget? icon;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;
  const RoundedButton(
      {this.onPressed,
      this.height,
      this.label,
      this.color,
      this.tooltipMessage,
      this.borderColor,
      this.textStyle,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Tooltip(
        message: tooltipMessage ?? '',
        child: Container(
            height: height ?? 40,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: color ?? Colors.blue,
              border: Border.all(color: borderColor ?? Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon ?? const SizedBox(),
                label != ''
                    ? Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          label ?? '',
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      )
                    : const SizedBox(),
              ],
            )),
      ),
    );
  }
}
