import 'package:get/get.dart';
import '../get/settings_controller.dart';

class SettingsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(SettingsController());
    }
}