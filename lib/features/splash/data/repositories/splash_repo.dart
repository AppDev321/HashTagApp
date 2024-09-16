
import 'package:hashtag/core/network/api_manager.dart';
import 'package:hashtag/features/splash/domain/entities/splash_model.dart';

import '../data_source/splash_data_source.dart';

class SplashRepo {
  final SplashDataSource remoteDataSource;
  final ApiManager apiManager;

  const SplashRepo(
      {required this.remoteDataSource, required this.apiManager});

  Future<AppConfig> getAppConfigurations() async {
    return apiManager.handleRequest(() async {
      return await remoteDataSource.getAppConfigurations();
    });
  }
}
