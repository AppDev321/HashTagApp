import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';

import '../../../../../core/utils/app_config_service.dart';
import '../../../../../core/widgets/custom_text_widget.dart';
import '../../../../../event_bus.dart';
import '../../domain/entities/hashtag_entitiy.dart';

class TagListComponent extends StatefulWidget {
  final List<HashTagEntity> tagList;

  const TagListComponent({super.key, required this.tagList});

  @override
  _TagListComponentState createState() => _TagListComponentState();
}

class _TagListComponentState extends State<TagListComponent> {


  late StreamSubscription<HashButtonUpdate> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = eventBus.on<HashButtonUpdate>().listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel(); // Cancel the subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tagList.length,
      itemBuilder: (context, index) {
        var tagData = widget.tagList[index];
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(text: tagData.mainText),

                      Row(children: [
                        const CustomTextWidget(text: "Copy All",size: 12,),
                        CustomSizeBox.width(10),
                        InkWell(
                            onTap: (){
                              copyToClipboard(context, tagData.tags);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.copy),
                            ))

                      ],)
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 8.0,
                  children: tagData.tags.split(" ")
                      .where((tag) => tag.length > 2)
                      .map((tag) {
                    final isSelected = ConfigService.selectedTags.contains(tag.trim());
                    return RepaintBoundary( // Helps with performance
                      child: CustomChip(
                        label: tag.trim(),
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
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
