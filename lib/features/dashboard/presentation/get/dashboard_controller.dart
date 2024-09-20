import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/database/database_helper.dart';

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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    someDatabaseOperation();

  }

  void someDatabaseOperation() async {
    final database = await Get.find<DatabaseHelper>().database;
    List<Map> list = await database.rawQuery('SELECT * FROM hashtag');
    print(list);

  }
}
