import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/dashboard/presentation/components/hash_button.dart';
import 'package:hashtag/features/home/presentation/components/home_cards.dart';
import 'package:hashtag/features/home/presentation/get/home_controller.dart';
import 'package:hashtag/gen/assets.gen.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/floatable_widget.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../routes/app_pages.dart';
import '../components/animated_search_button.dart';
import '../components/gradient_search_bar.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
      floatingWidget: const HashButton(),
      floatingWidgetHeight: 50,
      floatingWidgetWidth: 50,
      dx: 300,
      dy: Get.height/2,
      mainScreenWidget: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
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
              colorText: Colors.white,
            ),
            centerTitle: false,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(Assets.images.hashtag.path),
            ),
            leadingWidth: 50,
          /*  actions: [
              InkWell(
                onTap: () {
                  showBottomSheetDialog(context, const SocialMediaList());
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
              )
            ],*/
          ),
          body: Column(
            children: [
              CustomSizeBox.height(10),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomTextWidget(text: AppStrings.header1, size: 12),
              ),
              GradientSearchBox(
                  focusNode: focusNode,
                  onChanged: (value) {
                    controller.tagWord = value;
                  }),
              CustomSizeBox.height(50),
              Obx(
                () => AnimatedSearchButton(
                  isLoading: controller.isLoading.value,
                  onPressed: () {
                    focusNode.unfocus();
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
                    name:AppStrings.topTags,
                    desc: AppStrings.topTagsDesc,
                    backgroundColor: AppColors.appBarColorGradient,
                    imagePath: Assets.categories.celebration.path,
                    callback: (appBarColors) {
                      focusNode.unfocus();
                      var categoryData = SocialMediaIcons(name:AppStrings.topTags, image: Assets.categories.celebration.path);
                      var tagList = ConfigService().bestTagsList;
                      Get.toNamed(AppPages.ON_HOME_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: categoryData, AppPages.ARG_TAG_LIST: tagList, AppPages.ARG_APP_BAR_COLORS: appBarColors});
                    },
                  ),
                  HomeCard(
                    name: AppStrings.newTags,
                    desc: AppStrings.newTagsDesc,
                    backgroundColor: AppColors.appBarColorGradient,
                    imagePath: Assets.categories.flame.path,
                    callback: (appBarColors) {
                      focusNode.unfocus();
                      var categoryData = SocialMediaIcons(name: AppStrings.newTags, image: Assets.categories.flame.path);
                      var tagList = ConfigService().newTagsList;
                      Get.toNamed(AppPages.ON_HOME_TAG_DETAIL, arguments: {AppPages.ARG_CATEGORY: categoryData, AppPages.ARG_TAG_LIST: tagList, AppPages.ARG_APP_BAR_COLORS: appBarColors});
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
