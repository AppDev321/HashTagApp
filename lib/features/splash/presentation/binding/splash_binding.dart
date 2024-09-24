import 'package:get/get.dart';

import '../../../../core/api/data/data_source/api_data_source.dart';
import '../../../../core/api/data/repositories/api_repo.dart';
import '../get/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRepo>(() => ApiRepo(remoteDataSource: Get.find(), apiManager: Get.find()), fenix: true);
    Get.lazyPut<ApiDataSource>(() => ApiDataSourceImpl(Get.find()), fenix: true);
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(apiRepo: Get.find(), secureStorageService: Get.find()), fenix: true);
  }
}
