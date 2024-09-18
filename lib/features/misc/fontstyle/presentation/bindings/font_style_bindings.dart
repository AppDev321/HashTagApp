import 'package:get/get.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/get/font_style_controller.dart';

class FontStyleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FontStyleController());
  }
}
