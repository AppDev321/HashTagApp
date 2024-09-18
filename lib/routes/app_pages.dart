import 'package:get/get.dart';
import 'package:hashtag/features/dashboard/presentation/binding/dashboard_bindings.dart';
import 'package:hashtag/features/dashboard/presentation/widget/dashboard_page.dart';
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
  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const Splash(), binding: SplashBinding()),
    GetPage(name: _Paths.ON_BOARDING, page: () => const OnBoardingScreen()),
    GetPage(name: _Paths.ON_DASHBOARD, page: () => DashboardPage(), binding: DashboardBindings()),
    GetPage(name: _Paths.ON_MISC, page: () => MiscPage(), binding: MiscBindings()),
    GetPage(name: _Paths.ON_FONT_STYLING, page: () => FontStyleScreen(), binding: FontStyleBindings()),

  ];
}
