import 'package:get/get.dart';
import '../get/dashboard_controller.dart';

class DashboardBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(DashboardController());
    }
}