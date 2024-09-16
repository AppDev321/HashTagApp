import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/theme_provider.dart';
import '../../gen/assets.gen.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Get.find<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.settings,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: [
            // user card
            SimpleUserCard(
              userName: "",
              userProfilePic: AssetImage(Assets.images.hastag.path),
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
                  trailing:  Switch.adaptive(
                      value: themeProvider.selectedThemeMode == ThemeMode.dark,
                      onChanged: (value) {
                        controller.toggleTheme();
                      },
                    )

                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about HashTag",
                ),
              ],
            ),
            // You can add a settings title
          ],
        ),
      ),
    );
  }
}
