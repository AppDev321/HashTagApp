import 'package:get/get.dart';
import '../get/misc_controller.dart';

class MiscBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MiscController());
    }
}