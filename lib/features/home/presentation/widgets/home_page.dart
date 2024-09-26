import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/home/presentation/components/home_cards.dart';
import 'package:hashtag/features/home/presentation/get/home_controller.dart';
import 'package:hashtag/gen/assets.gen.dart';

import '../../../../core/popups/bottom_sheet_dialog.dart';
import '../../../../core/styles/colors.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../routes/app_pages.dart';
import '../components/animated_search_button.dart';
import '../components/gradient_search_bar.dart';
import '../components/social_recommendation_settings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.appBarColorGradient,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          titleSpacing: 0,
          title: const CustomTextWidget(
            text: AppStrings.appTitle,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(Assets.images.hashtag.path),
          ),
          leadingWidth: 50,
          actions: [
            InkWell(
              onTap: () {
                showBottomSheetDialog(context, const SocialMediaList());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            CustomSizeBox.height(10),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomTextWidget(text: AppStrings.header1, size: 12),
            ),
            GradientSearchBox(onChanged: (value) {
              controller.tagWord = value;
            }),
            CustomSizeBox.height(50),
            Obx(
              () => AnimatedSearchButton(
                isLoading: controller.isLoading.value,
                onPressed: () {
                   controller.getSearchWord(context, controller.tagWord);

                },
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                AppStrings.homeText1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: FontFamily.mulish),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeCard(
                  name: "Top Tags",
                  desc: "Discover Our Top Tags",
                  backgroundColor: AppColors.getRandomGradientColor(),
                  shadowColor: AppColors.topTagGradientColor[0],
                  imagePath: Assets.categories.celebration.path,
                  callback: (appBarColors) {
                    var categoryData = SocialMediaIcons(name: "Top Tags", image: Assets.categories.celebration.path);
                    var tagList = ConfigService().bestTagsList;

                    Get.toNamed(AppPages.ON_HOME_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: categoryData, AppPages.ARG_TAG_LIST: tagList, AppPages.ARG_APP_BAR_COLORS: appBarColors});
                  },
                ),
                Hero(
                  tag: "New Tags",
                  child: HomeCard(
                    name: "New Tags",
                    desc: "See Our Most Popular Tags",
                    backgroundColor: AppColors.getRandomGradientColor(),
                    shadowColor: AppColors.newTagGradientColor[0],
                    imagePath: Assets.categories.flame.path,
                    callback: (appBarColors) {
                      var categoryData = SocialMediaIcons(name: "New Tags", image: Assets.categories.flame.path);
                      var tagList = ConfigService().newTagsList;
                      Get.toNamed(AppPages.ON_HOME_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: categoryData, AppPages.ARG_TAG_LIST: tagList, AppPages.ARG_APP_BAR_COLORS: appBarColors});
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
