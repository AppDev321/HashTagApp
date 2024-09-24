import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/splash/presentation/get/splash_controller.dart';
import 'package:hashtag/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(apiRepo: Get.find(),secureStorageService: Get.find()),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    height: 200,
                    width: 200,
                    Assets.images.hashtag.path, // Make sure the path is correct
                    fit: BoxFit.cover, // Adjust to fit the image as needed
                  ),
                ),
              ],
            ),
          );
        });
  }


}
