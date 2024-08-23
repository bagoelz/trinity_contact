import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/helper/SharedPref.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final theme = "system".obs;
  late ThemeMode _themeMode;
  final store = SharedPref();

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => theme.value;

  @override
  void onInit() async {
    super.onInit();
    getThemeModeFromStore();
  }

  Future<void> setThemeMode(String value) async {
    theme.value = value;
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await store.save('theme', value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode _setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      _setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      _setThemeMode = ThemeMode.dark;
    }
    return _setThemeMode;
  }

  getThemeModeFromStore() async {
    String _themeString = store.read('theme') ?? 'system';
    setThemeMode(_themeString);
  }

  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }
}
