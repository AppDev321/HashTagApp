import 'package:hashtag/features/splash/domain/entities/splash_model.dart';

import '../../gen/assets.gen.dart';

class ConfigService {
  static final ConfigService _instance = ConfigService._internal();
  AppConfig? _configData;

  factory ConfigService() => _instance;

  ConfigService._internal();

  void setConfigData(AppConfig configData) {
    _configData = configData;
  }

  AppConfig? get configData => _configData;
  SocialMediaRecommendation? selectedSocialMedia;
  List<String> socialMediaPlatforms = [
    "Instagram",
    "TikTok",
    "X (Twitter)",
    "YouTube",
    "LinkedIn",
    "Snapchat",
    "Pinterest",
    "Facebook",
    "Threads",
  ];

  List<String> socialMediaImages = [
    Assets.icons.instagram.path,
    Assets.icons.tiktok.path,
    Assets.icons.twitter.path,
    Assets.icons.youtube.path,
    Assets.icons.linkedin.path,
    Assets.icons.snapchat.path,
    Assets.icons.pintrest.path,
    Assets.icons.facebook.path,
    Assets.icons.threads.path,
  ];

  String getPromptForHashTags(String socialMedia, String hashTag) {
    return """
    Generate 4 categories of trending $socialMedia hashtags related to the theme '$hashTag'. 
    Each category name should be written in uppercase letters. 
    For each category, provide 20 relevant hashtags. 
    Ensure that the hashtags are all in lowercase and can include emojis directly at the end of each hashtag without any spaces. 
    Present the output as a plain list, without bullet points or line breaks. 
    Sample output:
    {
        "data": [
            {
                "name": "CATEGORY NAME",
                "tags": ["#hashtag1", "#hashtag2", "#hashtag3"]
            },
            {
                "name": "CATEGORY NAME",
                "tags": ["#hashtag1", "#hashtag2", "#hashtag3"]
            }
        ]
    }
    """;
  }

  int getHashTagPromptRequestToken() => 20;

  List<SocialMediaRecommendation> get socialMediaRecommendation {
    return _configData?.socialMediaRecommendation ?? [];
  }


  List<SocialMediaIcons> getSocialMediaIconList() {
    List<SocialMediaIcons> items = [];
    for (int i = 0; i < socialMediaPlatforms.length; i++) {
      items.add(SocialMediaIcons(
        name: socialMediaPlatforms[i],
        image: socialMediaImages[i], // Use the corresponding image
      ));
    }
    return items;
  }

  void setSelectSocialMediaType(SocialMediaRecommendation? socialMediaType) {
    selectedSocialMedia = socialMediaType;
  }

  SocialMediaRecommendation getSelectSocialMediaType() {
   return  selectedSocialMedia ?? socialMediaRecommendation[0];
  }

}

class SocialMediaIcons {
  String name;
  String image;
  SocialMediaIcons({required this.name, required this.image});
}
