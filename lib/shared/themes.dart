import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trinity_contact/shared/constant.dart';

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

const pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
    TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
    TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
  },
);

Transition pageTransition() {
  if (GetPlatform.isIOS) {
    return Transition.cupertino;
  }
  if (GetPlatform.isAndroid) {
    return Transition.native;
  }

  return Transition.noTransition;
}

class ThemesDecorations {
  static ThemesDecorations instance = ThemesDecorations();

  final InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w300, color: CustomizeTheme.darkGrayColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: CustomizeTheme.lightBlueColor, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.blue, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: CustomizeTheme.darkGrayColor, width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),
  );

  final InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w300, color: CustomizeTheme.lightBlueColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: CustomizeTheme.lightBlueColor, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.blue, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: CustomizeTheme.darkGrayColor, width: 0.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey[400]!, width: 0.5),
    ),
  );
  ThemeData darkTheme(ColorScheme? colorSheme) {
    return ThemeData(
        colorScheme: colorSheme?.copyWith(onSurface: CustomizeTheme.whiteColor),
        dividerColor: Colors.white,
        iconTheme: const IconThemeData(
          color: CustomizeTheme.lightBlueColor,
        ),
        hintColor: Colors.grey,
        inputDecorationTheme: darkInputDecoration,
        useMaterial3: true,
        pageTransitionsTheme: pageTransitionsTheme);
  }

  ThemeData lightTheme(ColorScheme? colorSheme) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorSheme?.copyWith(
            onSurface: CustomizeTheme.contactTitel.withOpacity(0.6)),
        scaffoldBackgroundColor: CustomizeTheme.whiteColor,
        iconTheme: const IconThemeData(
          color: CustomizeTheme.lightBlueColor,
        ),
        inputDecorationTheme: lightInputDecoration,
        dividerColor: CustomizeTheme.dividerColor,
        hintColor: Colors.grey,
        pageTransitionsTheme: pageTransitionsTheme);
  }
}
