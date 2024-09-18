import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

OutlineInputBorder inputBorder = OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primaryColor), borderRadius: BorderRadius.circular(15.0));

OutlineInputBorder errorInputBorder = OutlineInputBorder(borderSide: const BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.circular(15.0));
class AppTheme {
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xFFADD8E6), // Light Blue
    onPrimary: Colors.black,
    background: Colors.white,
    onBackground: Colors.black,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    background: Color(0xFF121212),
    onBackground: Colors.white,
  );

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: lightColorScheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[200],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: darkColorScheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[850],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
  );
}