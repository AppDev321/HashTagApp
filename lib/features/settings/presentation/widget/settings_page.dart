import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../gen/assets.gen.dart';
import '../../data/data_source/icon_style.dart';
import '../components/about_component.dart';
import '../components/setting_item_component.dart';
import '../components/settings_group.dart';
import '../components/simple_user_card.dart';
import '../get/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),

        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: [
            // User card
            SimpleUserCard(
              userName: "",
              userProfilePic: AssetImage(Assets.images.hashtag.path),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
                  trailing: Obx(() {
                    return Switch.adaptive(
                      value: controller.themeProvider.isDarkMode.value,
                      onChanged: (value) {
                        controller.toggleTheme();
                      },
                    );
                  }),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    showAboutUsBottomSheet( context);
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about HashTag",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

