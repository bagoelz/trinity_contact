import 'package:flutter/material.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => theme.textTheme.displayLarge
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get displayMedium => theme.textTheme.displayMedium
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get displaySmall => theme.textTheme.displaySmall
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get headlineLarge => theme.textTheme.headlineLarge
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get headlineMedium => theme.textTheme.headlineMedium
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get headlineSmall => theme.textTheme.headlineSmall
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get titleLarge => theme.textTheme.titleLarge
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get titleMedium => theme.textTheme.titleMedium
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get titleSmall => theme.textTheme.titleSmall
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get labelLarge => theme.textTheme.labelLarge
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get labelMedium => theme.textTheme.labelMedium
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get labelSmall => theme.textTheme.labelSmall
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get bodyLarge => theme.textTheme.bodyLarge
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
  TextStyle? get bodySmall => theme.textTheme.bodySmall
      ?.copyWith(color: colors.onSurface, fontFamily: 'Poppins');
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 768;
  bool get isDesktop => maxWidth > 1028;
  bool get isMobile => !isTablet && !isDesktop;
}
