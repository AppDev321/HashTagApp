import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_assets.dart';
import 'package:hashtag/core/constants/place_holders.dart';
import 'package:hashtag/core/styles/colors.dart';
import 'package:hashtag/core/theme/widget/PrimaryColorSwitcher.dart';
import 'package:hashtag/core/theme/widget/ThemeSwitcher.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/splash/presentation/get/splash_controller.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_widget.dart';
import '../../builder_ids.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
 double _containerWidth = 450.0;

  @override
  void initState() {
    super.initState();
    SplashScreenController controller = Get.find();
    scaleController =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener(
            (status) {
          if (status == AnimationStatus.completed) {
         //   Get.off(LoginScreen());
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: Get.height).animate(scaleController);

    controller.startAnimation(scaleController);
  }


  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }


  @override
 Widget build(BuildContext context) {
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
