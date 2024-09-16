
import 'package:get/get.dart';

import 'features/dashboard/dashboard_controller.dart';
import 'features/settings/settings_controller.dart';

initMain() {
  Get.lazyPut(()=>DashboardController());
  Get.lazyPut(()=>SettingsController());
}


