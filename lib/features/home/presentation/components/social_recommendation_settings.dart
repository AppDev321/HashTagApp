import 'package:flutter/material.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';

import '../../../../core/api/domain/entities/app_config_model.dart';

class SocialMediaList extends StatefulWidget {
  const SocialMediaList({super.key});

  @override
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaList> {
  List<SocialMediaRecommendation> items = ConfigService().socialMediaRecommendation;
  SocialMediaRecommendation? selectedItem = ConfigService().getSelectSocialMediaType();
  List<SocialMediaIcons> socialMediaIcons = ConfigService().getSocialMediaIconList();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedItem();
    });*/
  }

  void _scrollToSelectedItem() {
    if (selectedItem != null) {
      int index = items.indexOf(selectedItem!);
      if (index != -1) {
        _scrollController.animateTo(
          index * 20.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(
          text: 'Select Social Media Type',
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        ListView.builder(
          controller: _scrollController, // Attach the ScrollController
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: items[index].platform, size: 16, fontWeight: FontWeight.w600,),
                  CustomTextWidget(text: "Allowed: ${items[index].maxHashtagsChar}",  size: 12,fontWeight: FontWeight.w600,),
                  CustomTextWidget(text: items[index].recommendation, size: 10,),
                ],
              ),
              leading: Image.asset(
                socialMediaIcons[index].image,
                width: 30,
                height: 30,
              ),
              trailing: Radio<SocialMediaRecommendation>(
                value: items[index],
                groupValue: selectedItem,
                onChanged: (SocialMediaRecommendation? value) {
                  setState(() {
                    selectedItem = value;
                    ConfigService().setSelectSocialMediaType(value);
                    _scrollToSelectedItem(); // Scroll to the newly selected item
                  });
                },
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: selectedItem == items[index] ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the controller
    super.dispose();
  }
}
