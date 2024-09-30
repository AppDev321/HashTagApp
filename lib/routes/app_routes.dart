part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const ON_BOARDING = _Paths.ON_BOARDING;
  static const ON_DASHBOARD = _Paths.ON_DASHBOARD;
  static const ON_MISC = _Paths.ON_MISC;
  static const ON_FONT_STYLING = _Paths.ON_FONT_STYLING;
  static const ON_CAPTION = _Paths.ON_CAPTION;
  static const ON_OFFLINE_HASHTAG= _Paths.ON_OFFLINE_HASHTAG;
  static const ON_OFFLINE_HASHTAG_DETAIL= _Paths.ON_OFFLINE_HASHTAG_DETAIL;
  static const ON_HOME_TAG_DETAIL = _Paths.ON_HOME_TAG_DETAIL;
  static const ON_HOME_SEARCH_TAG_DETAIL = _Paths.ON_HOME_SEARCH_TAG_DETAIL;
  static const ON_EDIT_TAG = _Paths.ON_EDIT_TAG;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const ON_BOARDING = '/on-boarding';
  static const ON_DASHBOARD = '/dashboard';
  static const ON_MISC = '/misc';
  static const ON_FONT_STYLING = '/font-style';
  static const ON_CAPTION = '/caption';
  static const ON_OFFLINE_HASHTAG = '/offline_hash_tag';
  static const ON_OFFLINE_HASHTAG_DETAIL ="/offline_hash_tag_detail";
  static const ON_HOME_TAG_DETAIL = "/home_tag_detail";
  static const ON_HOME_SEARCH_TAG_DETAIL = "/home_search_tag_detail";
  static const ON_EDIT_TAG = "/edit_tag";

}
