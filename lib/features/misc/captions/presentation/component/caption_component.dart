import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';

import '../../../../utils/caption_util.dart';

class CaptionList extends StatelessWidget {
  final List<Quote> selectedGenre;
  final String name;

  const CaptionList({super.key, required this.selectedGenre, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(text:name,fontWeight: FontWeight.w600,),
        SizedBox(
          height: Get.height,
          child: ListView.builder(
            itemCount: selectedGenre.length,
            itemBuilder: (BuildContext context, int index) {
              var item = selectedGenre[index];
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Get.isDarkMode?Colors.white12:Colors.grey.shade100, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(

                  title: CustomTextWidget(text:item.quote,size: 16,fontWeight: FontWeight.w500,),
                  subtitle:  CustomTextWidget(text:item.author,size: 12,),
                  trailing: InkWell(
                    onTap: () {
                      copyToClipboard(context, item.quote);
                    },
                    child: const Icon(Icons.copy_rounded),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
