import 'package:flutter/material.dart';
import 'package:flutter_test_recrutamento/app/core/utils/custom_colors_utils.dart';

class DefaultTheme {
  DefaultTheme._();

  static final themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    primaryColor: CustomColorsUtils.primaryColor,
    colorScheme: const ColorScheme(
      background: CustomColorsUtils.primaryColor,
      onBackground: Colors.white,
      secondary: CustomColorsUtils.secondaryColor,
      onSecondary: Colors.white,
      brightness: Brightness.dark,
      surface: CustomColorsUtils.primaryColor,
      onSurface: Colors.white,
      primary: CustomColorsUtils.primaryColor,
      onPrimary: Colors.white,
      error: CustomColorsUtils.errorColor,
      onError: Colors.white
    ),
  );  
}