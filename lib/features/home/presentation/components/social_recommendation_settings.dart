import 'package:flutter/material.dart';
import 'package:hashtag/core/utils/app_config_service.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import '../../../splash/domain/entities/splash_model.dart';

class SocialMediaList extends StatefulWidget {
  const SocialMediaList({super.key});

  @override
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaList> {
  List<SocialMediaRecommendation> items = ConfigService().socialMediaRecommendation;
  SocialMediaRecommendation? selectedItem;
  List<SocialMediaIcons> socialMediaIcons = ConfigService().getSocialMediaIconList();

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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text:items[index].platform,size: 16,fontWeight: FontWeight.w600,),
                  CustomTextWidget(text:"Allowed: ${items[index].maxHashtagsChar}"),
                  CustomTextWidget(text:items[index].recommendation,size: 12,),
                ],
              ),
              leading: Image.asset(
                socialMediaIcons[index].image,
                width: 30, // Set the width as needed
                height: 30, // Set the height as needed
              ),
              trailing: Checkbox(
                value: selectedItem == items[index],
                onChanged: (bool? value) {
                  setState(() {
                    selectedItem = items[index];
                  });
                },
              ),
              tileColor: selectedItem == items[index] ? Colors.blue[100] : null,
              shape: RoundedRectangleBorder(
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
}
