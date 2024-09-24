import 'package:hashtag/core/api/domain/entities/best_tags.dart';
import 'package:hashtag/core/constants/app_urls.dart';

import '../../../../core/network/api_manager.dart';
import '../../domain/entities/app_config_model.dart';

abstract class ApiDataSource {
  Future<AppConfig> getAppConfigurations();

  Future<List<CommonTags>> fetchApiHashTags(String endpoint);
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
}
