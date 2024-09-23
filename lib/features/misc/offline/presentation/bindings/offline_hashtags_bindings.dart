import 'package:get/get.dart';

import '../../../../../core/database/database_helper.dart';
import '../get/offline_hashtag_controller.dart';

class OfflineHashtagsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatabaseHelper>(() => DatabaseHelper());
    Get.put(OfflineHashTagController());
  }
}
