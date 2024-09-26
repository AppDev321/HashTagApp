import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/styles/colors.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_config_service.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/shadow_widget.dart';
import '../../../../gen/fonts.gen.dart';
import '../components/tag_list_component.dart';
import '../components/usage_tags_component.dart';

class SearchTagDetailsPage extends StatelessWidget {
  final String searchWord;
  final SearchApiResponse searchApiResponse;
  final List<Color> appBarColor;

  const SearchTagDetailsPage({
    Key? key,
    required this.searchWord,
    required this.searchApiResponse,
    required this.appBarColor,
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
              colors: appBarColor,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        titleSpacing: 0,
        centerTitle: false,
        title: CustomTextWidget(
          text: searchWord,
          fontWeight: FontWeight.w600,
          colorText: Colors.white,
          size: 25,
          fontFamily: FontFamily.mulish,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TagListComponent(
              tagList: searchApiResponse.best,
              categoryName: "Best HashTags",
              appBarColor: appBarColor,
            ),
            TagListComponent(
              tagList: searchApiResponse.recommended,
              categoryName: "Recommended HashTags",
              appBarColor: appBarColor,
            ),
            TagListComponent(
              tagList: searchApiResponse.popular,
              categoryName: "Popular HashTags",
              appBarColor: appBarColor,
            ),
            TagListComponent(
              tagList: searchApiResponse.related,
              categoryName: "Related HashTags",
              appBarColor: appBarColor,
            ),
            TagListComponent(
              tagList: searchApiResponse.exact,
              categoryName: "Exact Matched",
              appBarColor: appBarColor,
            ),
          ],
        ),
      ),
    );
  }
}
