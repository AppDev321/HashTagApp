import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/constants/app_urls.dart';
import 'package:hashtag/core/network/api_manager.dart';

import '../../domain/entities/app_config_model.dart';
import '../data_source/api_data_source.dart';

class ApiRepo {
  final ApiDataSource remoteDataSource;
  final ApiManager apiManager;

  const ApiRepo({required this.remoteDataSource, required this.apiManager});

  Future<AppConfig> getAppConfigurations() async {
    return apiManager.handleRequest(() async {
      return await remoteDataSource.getAppConfigurations();
    });
  }

  Future<List<CommonTags>> getBestTags() async {
    return apiManager.handleRequest(() async {
      return await remoteDataSource.fetchApiHashTags(AppUrls.bestTagsUrl);
    });
  }

  Future<List<CommonTags>> getNewTags() async {
    return apiManager.handleRequest(() async {
      return await remoteDataSource.fetchApiHashTags(AppUrls.newTagsUrl);
    });
  }

  Future<SearchApiResponse> getSearchTagsApi(String tagWord) async {
    return apiManager.handleRequest(() async {
      return await remoteDataSource.searchTagUsingApi(tagWord);
    });
  }

}
