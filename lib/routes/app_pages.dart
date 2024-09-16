import 'package:get/get.dart';
import 'package:hashtag/features/dashboard/dashboard_bindings.dart';
import 'package:hashtag/features/dashboard/dashboard_page.dart';
import 'package:hashtag/features/splash/presentation/widget/splash_binding.dart';

import '../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../features/splash/presentation/widget/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ON_BOARDING = Routes.ON_BOARDING;
  static const SPLASH = Routes.SPLASH;
  static const DASHBOARD = Routes.ON_DASHBOARD;
  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => const Splash(),binding: SplashBinding()),
    GetPage(name: _Paths.ON_BOARDING, page: () => const OnBoardingScreen()),
    GetPage(name: _Paths.ON_DASHBOARD, page: () =>  DashboardPage() , binding: DashboardBindings()),
  ];
}
