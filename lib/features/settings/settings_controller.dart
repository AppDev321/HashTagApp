import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/custom_logs.dart';

import '../../core/theme/theme_provider.dart';

class SettingsController extends GetxController {
  // Inject ThemeProvider dependency
  final ThemeProvider themeProvider = Get.find<ThemeProvider>();
  void toggleTheme() {

    CustomLogger.log("Theme = ${themeProvider.selectedThemeMode}");
    if (themeProvider.selectedThemeMode == ThemeMode.light) {
      themeProvider.setSelectedThemeMode(ThemeMode.dark);
    } else {
      themeProvider.setSelectedThemeMode(ThemeMode.light);
    }
  }
}