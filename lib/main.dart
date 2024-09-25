import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/theme/theme_provider.dart';
import 'package:hashtag/init_core.dart';
import 'package:hashtag/init_main.dart';
import 'package:hashtag/routes/app_pages.dart';

import 'core/styles/theme.dart';
import 'core/utils/secure_storage.dart';
import 'features/utils/caption_util.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await Get.putAsync(() async => SharedPreferencesService().init());
  initCore();
  initMain();

  runApp( MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
   MyApp({super.key});
  CaptionUtil captionUtil = Get.find();


  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() {
      final isDarkMode = themeController.isDarkMode.value;
      return Semantics(
        container: true,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: isDarkMode ? Colors.black : Colors.white, // Background color
            systemNavigationBarColor: Colors.transparent,//isDarkMode ? Colors.grey[850] : Colors.grey[300], // Navigation bar color
            statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark, // Status bar icon brightness
            systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark, // Navigation bar icon brightness
          ),
          child: GetMaterialApp(
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppPages.SPLASH,
            getPages: AppPages.routes,
            builder: (context, child) {
              return AnimatedTheme(
                data: themeController.isDarkMode.value ? AppTheme.dark : AppTheme.light,
                duration: const Duration(milliseconds: 300),
                child: child ?? Container(),
              );
            },
          ),
        ),
      );

    });
  }
}

