
import 'package:get/get.dart';
import 'package:hashtag/core/theme/theme_provider.dart';

import 'features/dashboard/presentation/get/dashboard_controller.dart';
import 'features/settings/presentation/get/settings_controller.dart';

initMain() {
  Get.lazyPut(()=>ThemeController());
  Get.lazyPut(()=>DashboardController());
  Get.lazyPut(()=>SettingsController());
}


