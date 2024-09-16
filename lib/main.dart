import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/styles/text_theme.dart';
import 'package:hashtag/core/theme/app_theme_colors.dart';
import 'package:hashtag/core/theme/theme_provider.dart';
import 'package:hashtag/core/utils/custom_logs.dart';
import 'package:hashtag/init_core.dart';
import 'package:hashtag/init_main.dart';
import 'package:hashtag/routes/app_pages.dart';
import 'package:provider/provider.dart';

import 'core/utils/secure_storage.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await Get.putAsync(() async => SharedPreferencesService().init());
  Get.put(ThemeProvider());

  initCore();
  initMain();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(builder: (c, themeProvider, child) {
          CustomLogger.log("UI App refresshed",object:this);
          return GetMaterialApp(
            navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.selectedThemeMode,
            initialRoute: AppPages.SPLASH,
            getPages: AppPages.routes,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: AppThemeColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
              textTheme: lightTextTheme,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppThemeColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
              textTheme: darkTextTheme,
            ),
            home: child,
          );
        }));
  }
}

