import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/get/font_style_controller.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class FontStyleScreen extends StatelessWidget {
  const FontStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontStyleController>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const Text(AppStrings.fontStyle),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  borderEnable: true,
                  text: AppStrings.fontStyleType,
                  fontWeight: FontWeight.normal,
                  onChanged: (value) {
                   controller.updateInputValue(value);
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: controller.fontList.length,
                itemBuilder: (BuildContext context, int index) {
                  var fontStyle = controller.fontList[index];
                  return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Get.isDarkMode?Colors.white12:Colors.grey.shade100, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                    child: ListTile(
                      trailing: InkWell(
                          onTap: (){
                           var copiedText =  controller.getConvertedStyleFontText(
                              controller.inputText.value,
                              fontStyle['id'],
                            );
                           copyToClipboard(context, copiedText);
                          },
                          child: const Icon(Icons.copy)),
                        title: CustomTextWidget(
                          text: fontStyle['fontName'],
                          size: 12,
                        ), // Use actual font name
                        subtitle: CustomTextWidget(
                            text: controller.getConvertedStyleFontText(
                              controller.inputText.value,
                              fontStyle['id'],
                            ),
                            size: 20)),
                  );
                },
              )),
            ],
          ),
        );
      },
    );
  }
}
