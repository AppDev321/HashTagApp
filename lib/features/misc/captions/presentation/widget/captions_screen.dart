import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';
import 'package:hashtag/core/popups/bottom_sheet_dialog.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/misc/captions/presentation/component/caption_component.dart';
import 'package:hashtag/features/misc/captions/presentation/get/caption_controller.dart';
import 'package:hashtag/features/utils/caption_util.dart';

class CaptionScreen extends GetView<CaptionController> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  CaptionScreen({super.key}); // Sample data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(AppStrings.captions),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0, childAspectRatio: 2),
        padding: const EdgeInsets.all(8.0), // Padding around the grid
        itemCount: controller.captionGenre.length,
        itemBuilder: (context, index) {
          var data = controller.captionGenre[index];
          var formatedData = controller.formatString(data);
          return InkWell(
            onTap: (){
             var listCaptions =  controller.getQuotesByGenre(data);
             showBottomSheetDialog(context, CaptionList(selectedGenre: listCaptions,name: formatedData,),padding: 5);
            },
            child: Card(
              elevation: 6,
              color: Get.isDarkMode ? Colors.blue.withOpacity(0.6) : Colors.redAccent.withOpacity(0.3),
              shadowColor: Colors.white60.withOpacity(0.2),
              child: Center(
                child: CustomTextWidget(
                  text: formatedData,
                  size: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
