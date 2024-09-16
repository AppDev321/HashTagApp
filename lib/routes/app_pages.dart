import 'package:get/get.dart';
import 'package:hashtag/features/splash/presentation/widget/splash_binding.dart';
import 'package:hashtag/features/splash/presentation/widget/splash_screen.dart';

import '../features/onboarding/presentation/pages/onboarding_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ON_BOARDING = Routes.ON_BOARDING;
  static const SPLASH = Routes.SPLASH;
  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const SplashScreen(),binding: SplashBinding()),
    GetPage(name: _Paths.ON_BOARDING, page: () => const OnBoardingScreen()),
  ];
}
