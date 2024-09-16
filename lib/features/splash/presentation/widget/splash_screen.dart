import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/theme/widget/PrimaryColorSwitcher.dart';
import 'package:hashtag/core/theme/widget/ThemeSwitcher.dart';
import 'package:hashtag/features/splash/presentation/get/splash_controller.dart';
import 'package:hashtag/gen/assets.gen.dart';

import '../../../../core/utils/custom_logs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _containerWidth = 450.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(splashRepo: Get.find(),secureStorageService: Get.find()),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    height: 200,
                    width: 200,
                    Assets.images.hastag.path, // Make sure the path is correct
                    fit: BoxFit.cover, // Adjust to fit the image as needed
                  ),
                ),
              ],
            ),
          );
        });
  }

  getSetting() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme & Primary Color Switcher'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
          width: _containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Theme'),
              ),
              ThemeSwitcher(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text('Primary Color'),
              ),
              PrimaryColorSwitcher(),
            ],
          ),
        ),
      ),
    );
  }
}
