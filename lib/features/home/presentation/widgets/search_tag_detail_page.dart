import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/api/domain/entities/search_api_response.dart';
import 'package:hashtag/core/styles/colors.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/features/dashboard/presentation/components/hash_button.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../components/tag_list_component.dart';

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
      floatingActionButton: const HashButton(),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: _buildTagLists(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
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
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  List<Widget> _buildTagLists() {
    final categories = [
      {'title': 'Best HashTags', 'tags': searchApiResponse.best},
      {'title': 'Recommended HashTags', 'tags': searchApiResponse.recommended},
      {'title': 'Popular HashTags', 'tags': searchApiResponse.popular},
      {'title': 'Related HashTags', 'tags': searchApiResponse.related},
      {'title': 'Exact Matched', 'tags': searchApiResponse.exact},
    ];

    return categories
        .where((category) => (category['tags'] as List<CommonTags>).isNotEmpty)
        .map((category) {
      return TagListComponent(
        tagList: category['tags'] as List<CommonTags>,
        categoryName: category['title'] as String,
        appBarColor: appBarColor,
      );
    }).toList();
  }
}
