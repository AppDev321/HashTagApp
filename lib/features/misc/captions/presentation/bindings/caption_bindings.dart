import 'package:get/get.dart';

import '../get/caption_controller.dart';

class CaptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CaptionController());
  }
}
