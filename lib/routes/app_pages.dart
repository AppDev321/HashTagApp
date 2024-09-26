import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/features/dashboard/presentation/binding/dashboard_bindings.dart';
import 'package:hashtag/features/dashboard/presentation/widget/dashboard_page.dart';
import 'package:hashtag/features/home/presentation/components/tag_list_component.dart';
import 'package:hashtag/features/home/presentation/widgets/home_tag_detail_page.dart';
import 'package:hashtag/features/home/presentation/widgets/search_tag_detail_page.dart';
import 'package:hashtag/features/misc/captions/presentation/bindings/caption_bindings.dart';
import 'package:hashtag/features/misc/captions/presentation/widget/captions_screen.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/bindings/font_style_bindings.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/widget/font_style_screen.dart';
import 'package:hashtag/features/misc/offline/presentation/bindings/offline_hashtags_bindings.dart';
import 'package:hashtag/features/misc/offline/presentation/widget/detail_page.dart';
import 'package:hashtag/features/misc/offline/presentation/widget/offline_hashtag_screen.dart';
import 'package:hashtag/features/misc/presentation/widget/misc_page.dart';
import 'package:hashtag/features/splash/presentation/binding/splash_binding.dart';

import '../core/utils/app_config_service.dart';
import '../features/misc/presentation/binding/misc_bindings.dart';
import '../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../features/splash/presentation/widget/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ARG_CATEGORY = "category";
  static const ARG_TAG_LIST = "tag_list";
  static const ARG_APP_BAR_COLORS = "app_bar_colors";







  static const ON_BOARDING = Routes.ON_BOARDING;
  static const SPLASH = Routes.SPLASH;
  static const DASHBOARD = Routes.ON_DASHBOARD;
  static const MISC = Routes.ON_MISC;
  static const FONT_STYLING = Routes.ON_FONT_STYLING;
  static const CAPTIONS = Routes.ON_CAPTION;
  static const ON_OFFLINE_HASHTAG = Routes.ON_OFFLINE_HASHTAG;
  static const ON_OFFLINE_HASHTAG_DETAIL = Routes.ON_OFFLINE_HASHTAG_DETAIL;
  static const ON_HOME_TAG_DETAIL = Routes.ON_HOME_TAG_DETAIL;
  static const ON_HOME_SEARCH_TAG_DETAIL = Routes.ON_HOME_SEARCH_TAG_DETAIL;



  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const Splash(), binding: SplashBinding()),
    GetPage(name: _Paths.ON_BOARDING, page: () => const OnBoardingScreen()),
    GetPage(name: _Paths.ON_DASHBOARD, page: () => DashboardPage(), binding: DashboardBindings()),
    GetPage(name: _Paths.ON_MISC, page: () => MiscPage(), binding: MiscBindings()),
    GetPage(name: _Paths.ON_FONT_STYLING, page: () => const FontStyleScreen(), binding: FontStyleBindings(), transition: Transition.rightToLeft),
    GetPage(name: _Paths.ON_CAPTION, page: () => CaptionScreen(), binding: CaptionBindings(), transition: Transition.rightToLeft),
    GetPage(name: _Paths.ON_OFFLINE_HASHTAG, page: () => const OfflineHashTagScreen(), binding: OfflineHashtagsBindings(), transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.ON_OFFLINE_HASHTAG_DETAIL,
        page: () {
          final SocialMediaIcons category = Get.arguments[ARG_CATEGORY];
          return DetailsPage(category: category);
        },
        transition: Transition.noTransition
        //binding: OfflineHashtagsBindings()
        ),
    GetPage(
        name: _Paths.ON_HOME_TAG_DETAIL,
        page: () {
          final SocialMediaIcons category = Get.arguments[ARG_CATEGORY];
          final List<CommonTags> tagDataList = Get.arguments[ARG_TAG_LIST];
          final List<Color> appBarColors = Get.arguments[ARG_APP_BAR_COLORS];
          return HomeTagDetailsPage(
            category: category,
            listTags: tagDataList,
            appBarColors: appBarColors,
          );
        },
        transition: Transition.noTransition
        //binding: OfflineHashtagsBindings()
        ),

    GetPage(
        name: _Paths.ON_HOME_SEARCH_TAG_DETAIL,
        page: () {
          final String searchWord = Get.arguments[ARG_CATEGORY];
          final SearchApiResponse searchResponse = Get.arguments[ARG_TAG_LIST];
          final List<Color> appBarColors = Get.arguments[ARG_APP_BAR_COLORS];
          return SearchTagDetailsPage(
            searchWord: searchWord,
            searchApiResponse: searchResponse,
            appBarColor: appBarColors,
          );
        },
        transition: Transition.rightToLeft
      //binding: OfflineHashtagsBindings()
    ),


  ];
}



class PageTransition extends CustomTransition {
  @override
  Widget buildTransition(BuildContext context, Curve? curve, Alignment? alignment, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    animation = CurvedAnimation(
      curve: Curves.fastLinearToSlowEaseIn,
      parent: animation,
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizeTransition(
        sizeFactor: animation,
        axisAlignment: 0,
        child: child,
      ),
    );
  }
}
