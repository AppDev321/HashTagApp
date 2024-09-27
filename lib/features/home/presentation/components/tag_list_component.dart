import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/popups/bottom_sheet_dialog.dart';
import 'package:hashtag/core/styles/colors.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';
import 'package:hashtag/gen/fonts.gen.dart';

import '../../../../core/utils/app_config_service.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/utils/widget_extensions.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../event_bus.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../routes/app_pages.dart';
import '../../../utils/common_utils.dart';

class TagListComponent extends StatefulWidget {
  final List<CommonTags> tagList;
  final String categoryName;
  final List<Color>? appBarColor;

  const TagListComponent({super.key, required this.tagList, required this.categoryName, this.appBarColor});

  @override
  _TagListComponentState createState() => _TagListComponentState();
}

class _TagListComponentState extends State<TagListComponent> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextWidget(
                    text: widget.categoryName,
                    size: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.mulish,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
                children: widget.tagList.map((data) {
              var tag = data.tag;

              final isSelected = ConfigService.selectedTags.contains(tag);
              return CustomChip(
                label: tag,
                isSelected: isSelected,
                onSelected: () {
                  setState(() {

                    if (ConfigService.selectedTags.contains(tag.trim())) {
                      ConfigService.selectedTags.remove(tag.trim());
                    } else {
                      ConfigService.selectedTags.add(tag.trim());
                    }
                    eventBus.fire(HashButtonUpdate());

                  });
                },
              );
            }).toList()),
            CustomSizeBox.height(10),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                // Optionally add padding or margin
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Makes the Row take minimum space
                  children: [
                    InkWell(
                      onTap: () {
                        var categoryData = SocialMediaIcons(name: "Analytics", image: Assets.categories.besttag.path);
                        var tagList = widget.tagList;
                        Get.toNamed(AppPages.ON_HOME_TAG_DETAIL, arguments: {
                          AppPages.ARG_CATEGORY: categoryData,
                          AppPages.ARG_TAG_LIST: tagList,
                          AppPages.ARG_APP_BAR_COLORS: widget.appBarColor ?? AppColors.appBarColorGradient
                        });
                      },
                      child: const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.add_chart_outlined),
                        ),
                        CustomTextWidget(
                          text: "Analytics",
                          size: 12,
                        ),
                      ]),
                    ),
                    CustomSizeBox.width(5),
                    InkWell(
                      onTap: () {
                        var tagsString = widget.tagList.map((data) => data.tag).join(' ');
                        copyToClipboard(context, tagsString);
                      },
                      child: const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.copy),
                        ),
                        CustomTextWidget(
                          text: "Copy All",
                          size: 12,
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
