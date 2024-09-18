
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  late SharedPreferences _prefs;

  Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  SharedPreferences get prefs => _prefs;
}

class SecureStorageService extends GetxService {
  late final SharedPreferencesService _sharedPreferencesService=Get.find<SharedPreferencesService>();
  static const String _firstTimeOpen = 'firstTimeOpen';
  static const String _appTheme = 'appTheme';



  Future<void> setAppOpenFirstTime() async {
    await _sharedPreferencesService.prefs.setBool(_firstTimeOpen, false);
  }

  Future<bool?> isAppOpenFirstTime() async {
    return _sharedPreferencesService.prefs.getBool(_firstTimeOpen);
  }


  Future<void> setAppThemeForDarkMode(bool isDarkMode) async {
    await _sharedPreferencesService.prefs.setBool(_appTheme, isDarkMode);
  }

  Future<bool?> isDarkModeActive() async {
    return _sharedPreferencesService.prefs.getBool(_appTheme);
  }


}