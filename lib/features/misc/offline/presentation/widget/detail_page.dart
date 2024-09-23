import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';

import '../component/tag_list_component.dart';
import '../get/offline_hashtag_controller.dart';
class DetailsPage extends StatefulWidget {
  final SocialMediaIcons category;

  const DetailsPage({Key? key, required this.category}) : super(key: key);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  final OfflineHashTagController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getTagsByCategory(widget.category.alias);
  }

  @override
  Widget build(BuildContext context) {
    // Calculate remaining height
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight; // Or any height you expect for your app bar
    double totalHeight = MediaQuery.of(context).size.height;
    double remainingHeight = totalHeight - statusBarHeight - appBarHeight ; // Adjust 50 as needed

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
                        GetBuilder<OfflineHashTagController>(
                          id: controller.widgetKey,
                          builder: (offlineController) {
                            var loading = offlineController.isDataLoading.value; // Use observable
                            var tagList = offlineController.offlineTagList; // Use observable list
                            return loading
                                ? const Center(child: CircularProgressIndicator())
                                : SizedBox(
                                height: remainingHeight,
                                child: TagListComponent(tagList: tagList,));
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
                tag: widget.category.name,
                child: Image.asset(
                  widget.category.image,
                  height: 50,
                  width: 50,
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
                  SizedBox(width: 10,),
                  CustomTextWidget(text: widget.category.name,fontWeight: FontWeight.w500,size: 25,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
