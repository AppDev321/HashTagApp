
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';

import '../../gen/assets.gen.dart';
import '../api/domain/entities/app_config_model.dart';

class ConfigService {
  static final ConfigService _instance = ConfigService._internal();
  AppConfig? _configData;

  factory ConfigService() => _instance;

  ConfigService._internal();

  void setConfigData(AppConfig configData) {
    _configData = configData;
  }

  AppConfig? get configData => _configData;
  static Set<String> selectedTags = {};
  //List<String> get selectedTags => _selectedTags.toList();


  List<CommonTags> bestTagsList = [];
  List<CommonTags> newTagsList = [];




  List<SocialMediaIcons> offlineTagsCategories = [
    SocialMediaIcons(name: 'Popular', alias: "mpth", image: Assets.categories.flame.path),
    SocialMediaIcons(name: 'Social Media', alias: "SM", image: Assets.categories.socialMedia.path),
    SocialMediaIcons(name: 'Makeup', alias: "makeup", image: Assets.categories.makeup.path),
    SocialMediaIcons(name: 'Party', alias: "party", image: Assets.categories.partyPopper.path),
    SocialMediaIcons(name: 'Gaming', alias: "gaming", image: Assets.categories.console.path),
    SocialMediaIcons(name: 'Fashion', alias: "fashion", image: Assets.categories.brand.path),
    SocialMediaIcons(name: 'Baby Mums', alias: "ytparenting", image: Assets.categories.mother.path),
    SocialMediaIcons(name: 'Food', alias: "food", image: Assets.categories.diet.path),
    SocialMediaIcons(name: 'Brands', alias: "brands", image: Assets.categories.brand.path),
    SocialMediaIcons(name: 'Holidays', alias: "holidays", image: Assets.categories.summerHolidays.path),
    SocialMediaIcons(name: 'Entertainments', alias: "Entertainment", image: Assets.categories.theater.path),
    SocialMediaIcons(name: 'Photography', alias: "photography", image: Assets.categories.camera.path),
    SocialMediaIcons(name: 'Feelings', alias: "Feelings", image: Assets.categories.emotional.path),
    SocialMediaIcons(name: 'Travel', alias: "travel", image: Assets.categories.travel.path),
    SocialMediaIcons(name: 'Moods', alias: "moods", image: Assets.categories.happy.path),
    SocialMediaIcons(name: 'Art', alias: "Art", image: Assets.categories.paint.path),
    SocialMediaIcons(name: 'Hobbies', alias: "tkdiy", image: Assets.categories.puzzle.path),
    SocialMediaIcons(name: 'Nature', alias: "Nature", image: Assets.categories.leaf.path),
    SocialMediaIcons(name: 'Week Days', alias: "weeks", image: Assets.categories.days.path),
    SocialMediaIcons(name: 'Fitness', alias: "ytfitness", image: Assets.categories.fitness.path),
    SocialMediaIcons(name: 'Animals', alias: "Animals", image: Assets.categories.pawprint.path),
    SocialMediaIcons(name: 'Music', alias: "ytmusic", image: Assets.categories.music.path),
    SocialMediaIcons(name: 'Seasonal', alias: "seasonal", image: Assets.categories.tree.path),
    SocialMediaIcons(name: 'Transport', alias: "Transports", image: Assets.categories.travel.path),
    SocialMediaIcons(name: 'Transportation', alias: "transportation", image: Assets.categories.deliveryTruck.path),
    SocialMediaIcons(name: 'People', alias: "People", image: Assets.categories.team.path),
    SocialMediaIcons(name: 'Work', alias: "work", image: Assets.categories.workingTime.path),
    SocialMediaIcons(name: 'Weather', alias: "weather", image: Assets.categories.weatherApp.path),
    SocialMediaIcons(name: 'Sports', alias: "Sports", image: Assets.categories.sports.path),
    SocialMediaIcons(name: 'Celebration', alias: "Celebration", image: Assets.categories.celebration.path),
    SocialMediaIcons(name: 'Countries', alias: "Countries", image: Assets.categories.country.path),
    SocialMediaIcons(name: 'Electronics', alias: "electronics", image: Assets.categories.gadgets.path),
  ];


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

  SocialMediaRecommendation? getSelectSocialMediaType() {
    if (socialMediaRecommendation.isNotEmpty) {
      return selectedSocialMedia ?? socialMediaRecommendation[0];
    } else {
      return null;
    }
  }


}

class SocialMediaIcons {
  String name;
  String alias = "";
  String image;

  SocialMediaIcons({required this.name, this.alias = "", required this.image});
}
