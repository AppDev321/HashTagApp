import 'package:get/get.dart';
import 'package:hashtag/core/utils/secure_storage.dart';

class ThemeController extends GetxController {
  final box = Get.find<SecureStorageService>();

  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    box.isDarkModeActive().then((mode) {
      isDarkMode.value = mode ?? false;
    });
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    box.setAppThemeForDarkMode(isDarkMode.value);
  }
}
