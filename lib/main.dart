import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/controller/Controller.dart';
import 'package:trinity_contact/shared/constant.dart';
import 'package:trinity_contact/shared/routes.dart';
import 'package:trinity_contact/shared/themes.dart';

import 'component/Component.dart';
import 'shared/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationController>(
        builder: (auth) => DynamicColorBuilder(
                builder: (ColorScheme? light, ColorScheme? dark) {
              ColorScheme lightColorScheme;
              ColorScheme darkColorScheme;
              if (light != null && dark != null) {
                lightColorScheme = light.harmonized()..copyWith();
                lightColorScheme =
                    lightColorScheme.copyWith(secondary: mainColor);
                darkColorScheme = dark.harmonized().copyWith();
              } else {
                lightColorScheme = ColorScheme.fromSeed(
                    brightness: Brightness.light,
                    seedColor: mainColor,
                    onSurface: CustomizeTheme.blueColor);
                darkColorScheme = ColorScheme.fromSeed(
                    seedColor: mainColor,
                    brightness: Brightness.dark,
                    onSurface: CustomizeTheme.blueColor);
              }

              return Loading(
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: AppsName,
                  theme:
                      ThemesDecorations.instance.lightTheme(lightColorScheme),
                  darkTheme:
                      ThemesDecorations.instance.darkTheme(darkColorScheme),
                  themeMode: ThemeMode.system,
                  initialRoute: '/signin',
                  getPages: AppRoutes.Routes,
                ),
              );
            }));
  }
}
