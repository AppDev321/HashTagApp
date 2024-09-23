import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/misc/offline/presentation/get/offline_hashtag_controller.dart';
import 'package:hashtag/routes/app_pages.dart';

import '../../../../../core/widgets/shadow_widget.dart';
import 'detail_page.dart';

class OfflineHashTagScreen extends GetView<OfflineHashTagController> {
  const OfflineHashTagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(AppStrings.offline_hashtags),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: ConfigService().offlineTagsCategories.length,
        itemBuilder: (context, index) {
          var data = ConfigService().offlineTagsCategories[index];
          return InkWell(
            onTap: () {
              Get.toNamed(AppPages.ON_OFFLINE_HASHTAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: data});
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Card(
                  elevation: 8,
                  color: Get.isDarkMode ? Colors.blueGrey : Colors.black.withOpacity(0.8),
                  child: SizedBox(
                    height: 80,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20), // Space for the image overlap
                          CustomTextWidget(
                            text: data.name,
                            size: 15,
                            colorText: Get.isDarkMode ? Colors.white : Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Hero(
                    tag:data.name,
                    child: SimpleShadow(
                      opacity: 0.7,
                      color: Colors.black,
                      offset: const Offset(4, 4),
                      sigma: 5,
                      child: Image.asset(
                        data.image,
                        height: 70,
                        width: 70,
                      ), // Default: 2
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
