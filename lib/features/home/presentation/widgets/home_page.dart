import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/home/presentation/get/home_controller.dart';
import 'package:hashtag/gen/assets.gen.dart';

import '../../../../core/popups/bottom_sheet_dialog.dart';
import '../components/social_recommendation_settings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
