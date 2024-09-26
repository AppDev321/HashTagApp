import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const int primaryColorHex = 0xFFF1FFEA;
  static final Color primaryColor = hexToColor("#F1FFEA");

  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color redAccent = Color(0xffB82713);
  static const Color whiteAccent = Color(0xffF2F2F2);
  static const Color themeTextColor = Color(0xFF2E604B);
  static const Color secondaryTextColor = Color(0xFF667085);

  static final MaterialColor primarySwatch = MaterialColor(primaryColorHex, {
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor,
  });

  static Color imageViewerBarrierColor = Colors.grey.withOpacity(0.6);
  static Color shimmerHighlightColor = Colors.grey[100]!;

  static Color hexToColor(String hexColor) {
    return Color(int.parse(hexColor.replaceAll("#", "0xFF")));
  }

  static Gradient appBackgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.white,
      hexToColor('#F1FFEA'),
    ],
  );

  static List<Color> appBarColorGradient = [
    AppColors.hexToColor("#617388"),
    AppColors.hexToColor("#303943")];

  static List<Color> topTagGradientColor = [
    AppColors.hexToColor("#1769aa"),
    AppColors.hexToColor("#2196f3"),
  ];

  static List<Color> newTagGradientColor = [
    AppColors.hexToColor("#3f51b5"),
    AppColors.hexToColor("#5C5EDD"),
  ];

  static List<List<Color>> randomColors = [
    [
      AppColors.hexToColor("#1769aa"),
      AppColors.hexToColor("#2196f3"),
    ],
    [
      AppColors.hexToColor("#aa2e25"),
      AppColors.hexToColor("#f44336"),
    ],
    [
      AppColors.hexToColor("#00695f"),
      AppColors.hexToColor("#009688"),
    ],
    [
      AppColors.hexToColor("#ab003c"),
      AppColors.hexToColor("#f50057"),
    ],
    [
      AppColors.hexToColor("#00897b"),
      AppColors.hexToColor("#004d40"),
    ],
    [
      AppColors.hexToColor("#1b5e20"),
      AppColors.hexToColor("#43a047"),
    ],

    [
      AppColors.hexToColor("#617388"),
      AppColors.hexToColor("#303943"),
    ],


    [
      AppColors.hexToColor("#E26352"),
      AppColors.hexToColor("#B85143"),
    ],
    //appBarColorGradient,
    newTagGradientColor,
    topTagGradientColor
  ];

  static List<Color> getRandomGradientColor() {
    final random = Random();
    int listIndex = random.nextInt(randomColors.length);
    return randomColors[listIndex];
  }
}
