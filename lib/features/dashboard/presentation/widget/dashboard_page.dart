import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/misc/presentation/widget/misc_page.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../home/presentation/widgets/home_page.dart';
import '../../../settings/presentation/widget/settings_page.dart';
import '../get/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    HomePage(),
    MiscPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: Obx(() {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.appBarColorGradient,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              /*boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],*/
            ),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.currentBottomTabIndex.value,
              onTap: controller.onTabTapped,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.tag),
                  label: AppStrings.generate,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.miscellaneous_services),
                  label: AppStrings.misc,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppStrings.settings,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
