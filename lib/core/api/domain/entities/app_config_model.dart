import 'package:equatable/equatable.dart';

class AppConfig extends Equatable {
  const AppConfig({
    required this.enableBilling,
    required this.enableAds,
    required this.maxRequest,
    required this.socialMediaRecommendation,
  });

  final bool enableBilling;
  final bool enableAds;
  final String maxRequest;
  final List<SocialMediaRecommendation> socialMediaRecommendation;

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      enableBilling: json["enable_billing"] ?? false,
      enableAds: json["enable_ads"] ?? false,
      maxRequest: json["max_request"] ?? "",
      socialMediaRecommendation:
          json["social_media_recomendation"] == null ? [] : List<SocialMediaRecommendation>.from(json["social_media_recomendation"]!.map((x) => SocialMediaRecommendation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "enable_billing": enableBilling,
        "enable_ads": enableAds,
        "max_request": maxRequest,
        "social_media_recomendation": socialMediaRecommendation.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        enableBilling,
        enableAds,
        maxRequest,
        socialMediaRecommendation,
      ];
}

class SocialMediaRecommendation extends Equatable {
  const SocialMediaRecommendation({
    required this.platform,
    required this.maxHashtagsChar,
    required this.recommendation,
  });

  final String platform;
  final String maxHashtagsChar;
  final String recommendation;

  factory SocialMediaRecommendation.fromJson(Map<String, dynamic> json) {
    return SocialMediaRecommendation(
      platform: json["platform"] ?? "",
      maxHashtagsChar: json["max_hashtags_char"] ?? "",
      recommendation: json["recommendation"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "max_hashtags_char": maxHashtagsChar,
        "recommendation": recommendation,
      };

  @override
  List<Object?> get props => [
        platform,
        maxHashtagsChar,
        recommendation,
      ];
}
