import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFF06F691);
  static const Color darkGreyColor = Color(0xFF252525);
  static const Color greyColor = Color(0xFF303030);
  static const Color lightGreyColor = Color(0xFF515151);
  static const Color dividerColor = Color(0xFF3f3f3f);
  static const Color textGreyColor = Color(0xFF979797);
  static const Color whiteColor = Color(0xFFFCFCFC);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: darkGreyColor,
    primaryColor: primaryColor,
  );
}
