import 'package:flutter/material.dart';
import 'package:hashtag/core/theme/app_theme_colors.dart';
import 'package:hashtag/core/theme/app_theme.dart';

import '../utils/custom_logs.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode selectedThemeMode = appThemes[0].mode;

  setSelectedThemeMode(ThemeMode themeMode) {
    CustomLogger.log("theme cahnges",object:this);
    selectedThemeMode = themeMode;
    notifyListeners();
  }

  Color selectedPrimaryColor = AppThemeColors.primaryColors[0];

  setSelectedPrimaryColor(Color color) {
    selectedPrimaryColor = color;
    notifyListeners();
  }
}
