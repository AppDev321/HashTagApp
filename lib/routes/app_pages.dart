import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/dashboard/presentation/binding/dashboard_bindings.dart';
import 'package:hashtag/features/dashboard/presentation/widget/dashboard_page.dart';
import 'package:hashtag/features/misc/captions/presentation/bindings/caption_bindings.dart';
import 'package:hashtag/features/misc/captions/presentation/widget/captions_screen.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/bindings/font_style_bindings.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/widget/font_style_screen.dart';
import 'package:hashtag/features/misc/presentation/widget/misc_page.dart';
import 'package:hashtag/features/splash/presentation/binding/splash_binding.dart';

import '../features/misc/presentation/binding/misc_bindings.dart';
import '../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../features/splash/presentation/widget/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ON_BOARDING = Routes.ON_BOARDING;
  static const SPLASH = Routes.SPLASH;
  static const DASHBOARD = Routes.ON_DASHBOARD;
  static const MISC = Routes.ON_MISC;
  static const FONT_STYLING = Routes.ON_FONT_STYLING;
  static const CAPTIONS = Routes.ON_CAPTION;
  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const Splash(), binding: SplashBinding()),
    GetPage(name: _Paths.ON_BOARDING, page: () => const OnBoardingScreen()),
    GetPage(name: _Paths.ON_DASHBOARD, page: () => DashboardPage(), binding: DashboardBindings()),
    GetPage(name: _Paths.ON_MISC, page: () => MiscPage(), binding: MiscBindings()),
    GetPage(name: _Paths.ON_FONT_STYLING, page: () => const FontStyleScreen(), binding: FontStyleBindings(), transition: Transition.rightToLeft),
    GetPage(name: _Paths.ON_CAPTION, page: () =>  CaptionScreen(), binding: CaptionBindings(), transition: Transition.rightToLeft),
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
