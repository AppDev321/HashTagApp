import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/gen/fonts.gen.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_config_service.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/shadow_widget.dart';
import '../components/tag_list_component.dart';
import '../components/usage_tags_component.dart';

class HomeTagDetailsPage extends StatelessWidget {
  final SocialMediaIcons category;
  final List<CommonTags> listTags;
  final List<Color> appBarColors;

  const HomeTagDetailsPage({
    Key? key,
    required this.category,
    required this.listTags,
    required this.appBarColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appBarColors,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
        title: CustomTextWidget(
          text: category.name,
          fontWeight: FontWeight.w600,
          colorText: Colors.white,
          fontFamily: FontFamily.mulish,

          size: 25,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Hero(
            tag: category.name,
            child: SimpleShadow(
              opacity: 0.5,
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(2, 2),
              sigma: 5,
              child: Image.asset(
                category.image,
                height: 40,
                width: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: listTags.isNotEmpty
                ? Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      padding: const EdgeInsets.all(8.0),
                      child: UsageTagListComponent(
                        tagList: listTags
                      ),
                    )
                : const Center(
                    child: CustomTextWidget(
                      text: AppStrings.defaultNotFoundErrorMessage,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
