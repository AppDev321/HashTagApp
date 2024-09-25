import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';

import '../../../../../core/widgets/shadow_widget.dart';
import '../../domain/entities/hashtag_entitiy.dart';
import '../component/tag_list_component.dart';
import '../get/offline_hashtag_controller.dart';

class DetailsPage extends StatelessWidget {
  final SocialMediaIcons category;

  const DetailsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate remaining height
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    double totalHeight = MediaQuery.of(context).size.height;
    double remainingHeight = totalHeight - statusBarHeight - appBarHeight;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        FutureBuilder<List<HashTagEntity>>(
                          future: Get.find<OfflineHashTagController>().getTagsByCategory(category.alias),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return SizedBox(
                                height: remainingHeight,
                                child: const Center(child: CircularProgressIndicator()),
                              );
                            } else if (snapshot.hasError) {
                              return SizedBox(
                                height: remainingHeight,
                                child: Center(child: Text('Error: ${snapshot.error}')),
                              );
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return SizedBox(
                                height: remainingHeight,
                                child: const Center(child: Text('No tags found')),
                              );
                            }

                            var tagList = snapshot.data!;
                            return SizedBox(
                              height: remainingHeight,
                              child: TagListComponent(tagList: tagList),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              child: Hero(
                tag: category.name,
                child: SimpleShadow(
                  opacity: 0.5,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2, 2),
                  sigma: 5,
                  child: Image.asset(
                    category.image,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 10),
                  CustomTextWidget(
                    text: category.name,
                    fontWeight: FontWeight.w500,
                    size: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}