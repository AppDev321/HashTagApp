
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/styles/color_schemes.dart';
import 'package:hashtag/core/styles/text_theme.dart';
import 'package:hashtag/core/theme/ThemeProvider.dart';
import 'package:hashtag/core/theme/app_theme_colors.dart';
import 'package:hashtag/features/splash/presentation/widget/splash_screen.dart';
import 'package:hashtag/init_core.dart';
import 'package:hashtag/init_main.dart';
import 'package:provider/provider.dart';



 

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  initCore();
  initMain();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('Rebuilt App!');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        child: const SplashScreen(),
        builder: (c, themeProvider, child) {
          return GetMaterialApp(
                navigatorKey: Get.key,
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.selectedThemeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: AppColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: AppColors.getMaterialColorFromColor(themeProvider.selectedPrimaryColor),
              primaryColor: themeProvider.selectedPrimaryColor,
            ),
            home: child,
          );
        },
      ),
    );
  }
}