import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/custom_logs.dart';
import 'package:hashtag/core/utils/secure_storage.dart';
import 'package:hashtag/features/splash/data/repositories/splash_repo.dart';
import 'package:hashtag/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final SplashRepo splashRepo;
  final SecureStorageService secureStorageService;

  SplashScreenController({required this.splashRepo, required this.secureStorageService});

  var isApiLoading = false;
  late AnimationController scaleController;

  startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 800));
    secureStorageService.isAppOpenFirstTime().then((isFirstTime) {
      if (isFirstTime == null || isFirstTime == true) {
        secureStorageService.setAppOpenFirstTime();
        Get.toNamed(AppPages.ON_BOARDING);
      } else {
        CustomLogger.log("Not FirstTime app");
        Get.offNamed(AppPages.ON_BOARDING);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    startAnimation();
  }
}
