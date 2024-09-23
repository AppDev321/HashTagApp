import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentBottomTabIndex = 0.obs;
  final PageController pageController = PageController();


  void onTabTapped(int index) {
    currentBottomTabIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentBottomTabIndex.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }




}
