import 'package:flutter/material.dart';



class HashTagAppTheme {
  ThemeMode mode;
  String title;
  IconData icon;
  HashTagAppTheme(
      {required this.mode, required this.title, required this.icon});
}


List<HashTagAppTheme> appThemes = [
  HashTagAppTheme(
    mode: ThemeMode.light,
    title: 'Light',
    icon: Icons.brightness_5_rounded,
  ),
  HashTagAppTheme(
    mode: ThemeMode.dark,
    title: 'Dark',
    icon: Icons.brightness_2_rounded,
  ),
  HashTagAppTheme(
    mode: ThemeMode.system,
    title: 'Auto',
    icon: Icons.brightness_4_rounded,
  ),
];
