import 'package:get/get.dart';

import '../../../../core/theme/theme_provider.dart';

class SettingsController extends GetxController {
  final themeProvider = Get.find<ThemeController>();

  void toggleTheme() {
    themeProvider.toggleTheme();
  }
}
