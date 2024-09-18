import 'package:get/get.dart';

import '../../data/data_source/splash_data_source.dart';
import '../../data/repositories/splash_repo.dart';
import '../get/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRepo>(() => SplashRepo(remoteDataSource: Get.find(), apiManager: Get.find()), fenix: true);
    Get.lazyPut<SplashDataSource>(() => SplashDataSourceImpl(Get.find()), fenix: true);
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(splashRepo: Get.find(), secureStorageService: Get.find()), fenix: true);
  }
}
