import 'package:get/get.dart';
import 'package:hashtag/core/utils/secure_storage.dart';
import 'package:hashtag/features/splash/data/repositories/splash_repo.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/utils/app_config_service.dart';

class SplashScreenController extends GetxController {
  final SplashRepo splashRepo;
  final SecureStorageService secureStorageService;

  SplashScreenController({required this.splashRepo, required this.secureStorageService});



  @override
  void onReady() {
    super.onReady();
    getApplicationConfiguration();

  }

  getApplicationConfiguration() async {
    await splashRepo.getAppConfigurations().then((value) async {
      ConfigService().setConfigData(value);
    }).onError<CustomError>((error, stackTrace) async {

    });
  }

}
