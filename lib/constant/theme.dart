import 'package:flutter/material.dart';
import 'package:mindease/constant/constant.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Neutral.light4,
    colorSchemeSeed: Primary.mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Neutral.light4,
      surfaceTintColor: Neutral.transparent,
    ),
  );
}