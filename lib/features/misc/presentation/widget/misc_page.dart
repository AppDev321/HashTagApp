import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/features/misc/captions/presentation/widget/captions_screen.dart';

import '../../../../routes/app_pages.dart';
import '../../../dashboard/presentation/widget/dashboard_page.dart';
import '../../../settings/data/data_source/icon_style.dart';
import '../../../settings/presentation/components/setting_item_component.dart';
import '../../../settings/presentation/components/settings_group.dart';
import '../../../splash/presentation/widget/splash.dart';
import '../get/misc_controller.dart';

class MiscPage extends GetView<MiscController> {
  MiscPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                 Get.toNamed(AppPages.FONT_STYLING);
                },
                icons: Icons.font_download_sharp,
                iconStyle: IconStyle(
                  backgroundColor: Colors.redAccent,
                ),
                title: AppStrings.fontStyle,
                subtitle: "View your text in various fonts. Type your text, and we’ll display it in different styles.",
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  Get.toNamed(AppPages.CAPTIONS);
                },
                icons: Icons.closed_caption_off_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.blue,
                ),
                title: AppStrings.captions,
                subtitle: "Quotes and social media captions are powerful tools for expression and engagement across platforms.",
              ),
            ],
          ),

          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  Get.toNamed(AppPages.ON_OFFLINE_HASHTAG);
                },
                icons: Icons.tag_sharp,
                iconStyle: IconStyle(
                  backgroundColor: Colors.green,
                ),
                title: AppStrings.offline_hashtags,
                subtitle: "Utilize thousands of offline tags across various categories.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
