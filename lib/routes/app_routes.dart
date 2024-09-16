part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const ON_BOARDING = _Paths.ON_BOARDING;
  static const ON_DASHBOARD = _Paths.ON_DASHBOARD;

}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const ON_BOARDING = '/on-boarding';
  static const ON_DASHBOARD = '/dashboard';
  }
