import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/dashboard/dashboard_page.dart';
import 'package:hashtag/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:hashtag/gen/assets.gen.dart';
import 'package:hashtag/routes/app_pages.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/custom_logs.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../dashboard/dashboard_controller.dart';
import '../../../home/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  final SecureStorageService secureStorageService = Get.find();
  bool isFirstTime = false;

  @override
  void initState()  {
    super.initState();
     secureStorageService.isAppOpenFirstTime().then((fistTime){
    if (fistTime == null || fistTime == true) {
      secureStorageService.setAppOpenFirstTime();
      isFirstTime = true;
    } else {
      isFirstTime = false;
      CustomLogger.log("Not FirstTime app");
    }});

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 8));
    animation1 = Tween<double>(begin: 35, end: 20).animate(CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();
    Timer(const Duration(seconds: 6), () {
      setState(() {
        _fontSize = 1.06;
      });
    });
    Timer(const Duration(seconds: 6), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(const Duration(seconds: 8), () {
      setState(() {
        if(isFirstTime) {
          Navigator.pushReplacement(context, PageTransition(const OnBoardingScreen()));
        } else{
          Navigator.pushReplacement(context, PageTransition( DashboardPage()));
          //Get.offNamed(AppPages.DASHBOARD,);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(duration: const Duration(seconds: 8), curve: Curves.fastLinearToSlowEaseIn, height: height / _fontSize),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _textOpacity,
                child: Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / _containerSize,
                  width: width / _containerSize,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  child: Image.asset(Assets.images.hastag.path)),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}

