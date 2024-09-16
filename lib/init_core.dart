import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/services/network_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core/network/api_manager.dart';
import 'core/network/dio_client.dart';
import 'core/utils/secure_storage.dart';

initCore() {
  Get.lazyPut<SecureStorageService>(() => SecureStorageService(), fenix: true);

  Get.lazyPut<InternetConnectionCheckerPlus>(() => InternetConnectionCheckerPlus(), fenix: true);

  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(Get.find()), fenix: true);

  Get.lazyPut<Dio>(() => Dio(), fenix: true);
  Get.lazyPut<DioClient>(() => DioClient(Get.find()), fenix: true);

  Get.lazyPut<ApiManager>(() => ApiManager(Get.find(), Get.find(), Get.find()), fenix: true);
}
