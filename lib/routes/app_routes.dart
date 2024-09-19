part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const ON_BOARDING = _Paths.ON_BOARDING;
  static const ON_DASHBOARD = _Paths.ON_DASHBOARD;
  static const ON_MISC = _Paths.ON_MISC;
  static const ON_FONT_STYLING = _Paths.ON_FONT_STYLING;
  static const ON_CAPTION = _Paths.ON_CAPTION;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const ON_BOARDING = '/on-boarding';
  static const ON_DASHBOARD = '/dashboard';
  static const ON_MISC = '/misc';
  static const ON_FONT_STYLING = '/font-style';
  static const ON_CAPTION = '/caption';
}
