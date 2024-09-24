import 'package:get/get.dart';
import 'package:hashtag/core/api/data/repositories/api_repo.dart';
import 'package:hashtag/core/utils/custom_logs.dart';
import 'package:hashtag/core/utils/secure_storage.dart';

import '../../../../core/error/errors.dart';
import '../../../../core/utils/app_config_service.dart';

class SplashScreenController extends GetxController {
  final ApiRepo apiRepo;
  final SecureStorageService secureStorageService;

  SplashScreenController({required this.apiRepo, required this.secureStorageService});

  @override
  void onReady() {
    super.onReady();
    getApplicationConfiguration();
  }

  getApplicationConfiguration() async {
    await apiRepo.getAppConfigurations().then((value) async {
      ConfigService().setConfigData(value);
    }).onError<CustomError>((error, stackTrace) async {
      CustomLogger.log(error.message, object: this);
    });

    await apiRepo.getBestTags().then((value) async {
      ConfigService().bestTagsList = value;
    }).onError<CustomError>((error, stackTrace) async {
      CustomLogger.log(error.message, object: this);
    });

    await apiRepo.getNewTags().then((value) async {
      ConfigService().newTagsList = value;
    }).onError<CustomError>((error, stackTrace) async {
      CustomLogger.log(error.message, object: this);
    });
  }
}
