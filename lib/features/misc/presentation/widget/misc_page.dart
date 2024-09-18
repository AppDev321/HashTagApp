import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../settings/data/data_source/icon_style.dart';
import '../../../settings/presentation/components/setting_item_component.dart';
import '../../../settings/presentation/components/settings_group.dart';
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
                Get.toNamed(Routes.ON_FONT_STYLING);
                },
                icons: Icons.font_download_sharp,
                iconStyle: IconStyle(
                  backgroundColor: Colors.redAccent,
                ),
                title: 'Fonts',
                subtitle: "View your text in various fonts. Type your text, and we’ll display it in different styles.",
              ),
            ],
          ),

        ],
      ),
    );
  }
}
