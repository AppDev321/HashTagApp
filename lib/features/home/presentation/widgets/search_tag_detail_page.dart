import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/styles/colors.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/app_config_service.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/shadow_widget.dart';
import '../components/tag_list_component.dart';
import '../components/usage_tags_component.dart';

class SearchTagDetailsPage extends StatelessWidget {
  final String searchWord;
  final SearchApiResponse searchApiResponse;

  const SearchTagDetailsPage({
    Key? key,
    required this.searchWord,
    required this.searchApiResponse,

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
              colors: AppColors.getRandomGradientColor(),
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
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

    );
  }
}
