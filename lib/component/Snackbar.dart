import 'package:flutter/material.dart';
import 'package:get/get.dart';

sendSnackbar({title, message, durasi = 3}) {
  Get.snackbar(title, message,
      maxWidth: 800,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: durasi),
      backgroundColor: Colors.grey,
      colorText: Get.theme.snackBarTheme.actionTextColor);
}
