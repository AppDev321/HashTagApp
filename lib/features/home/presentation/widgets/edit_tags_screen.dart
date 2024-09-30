import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/core/widgets/custom_text_field.dart';
import 'package:hashtag/features/home/presentation/get/home_controller.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../gen/fonts.gen.dart';

class EditTagsScreen extends StatefulWidget {
  const EditTagsScreen({super.key});

  @override
  _EditTagsScreenState createState() => _EditTagsScreenState();
}

class _EditTagsScreenState extends State<EditTagsScreen> with TickerProviderStateMixin {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.refreshHashTagList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
          text: AppStrings.editTags,
          size: 20,
          fontWeight: FontWeight.bold,
          colorText: Colors.white,
          fontFamily: FontFamily.mulish,
        ),
        centerTitle: false,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [
          GestureDetector(
            onTap: () {
              controller.copyAction(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.copy),
            ),
          ),
          GestureDetector(
            onTap: () {
              controller.showDeleteConfirmationDialog(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
          id: ediTagScreenKey, // Make sure this matches your key constant
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hintText: 'Type hashtags to add ...',
                    onChanged: controller.handleEditTagInput,
                    controller: controller.tagEditController,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        Wrap(
                          spacing: 8.0,
                          children: controller.hashTagList.map((tag) {
                            return Chip(
                              padding: EdgeInsets.zero,
                              deleteIcon: const Icon(Icons.delete, color: Colors.black),
                              backgroundColor: Get.isDarkMode ? Colors.blueGrey.shade200 : Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              label: CustomTextWidget(text: tag, colorText: Colors.black, size: 14),
                              onDeleted: () {
                                controller.removeHashTagFromList(tag);
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
