import 'package:get/get_common/get_reset.dart';
import 'package:get/utils.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/constants/app_urls.dart';

import '../../../../core/network/api_manager.dart';
import '../../domain/entities/app_config_model.dart';
import '../../domain/entities/search_api_response.dart';

abstract class ApiDataSource {
  Future<AppConfig> getAppConfigurations();
  Future<List<CommonTags>> fetchApiHashTags(String endpoint);
  Future<SearchApiResponse> searchTagUsingApi(String tagWord);
}

class ApiDataSourceImpl implements ApiDataSource {
  final ApiManager apiManager;

  ApiDataSourceImpl(this.apiManager);

  @override
  Future<AppConfig> getAppConfigurations() async {
    return await apiManager.makeApiRequest<AppConfig>(
      url: AppUrls.configUrl,
      method: RequestMethod.GET,
      //data: jsonMap,
      fromJson: (json) => AppConfig.fromJson(json['data']),
    );
  }

  @override
  Future<List<CommonTags>> fetchApiHashTags(String endpoint) async {
    return await apiManager.makeApiRequest<List<CommonTags>>(
      url: endpoint,
      method: RequestMethod.GET,
      fromJson: (json) => (json['data'] as List).map((tag) => CommonTags.fromJson(tag)).toList(),
    );
  }

  @override
  Future<SearchApiResponse> searchTagUsingApi(String tagWord) async {
    return await apiManager.makeApiRequest<SearchApiResponse>(
      url: AppUrls.searchTagApi+tagWord,
      method: RequestMethod.GET,
      fromJson: (json) => SearchApiResponse.fromJson(json['data']));
  }
}
