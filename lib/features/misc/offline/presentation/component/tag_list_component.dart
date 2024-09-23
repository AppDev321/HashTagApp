import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';

import '../../domain/entities/hashtag_entitiy.dart';

class TagListComponent extends StatefulWidget {
  final List<HashTagEntity> tagList;

  const TagListComponent({super.key, required this.tagList});

  @override
  _TagListComponentState createState() => _TagListComponentState();
}

class _TagListComponentState extends State<TagListComponent> {
  final Set<String> _selectedTags = {};

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomTextWidget(text: tagData.mainText),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  children: tagData.tags.split(" ")
                      .where((tag) => tag.length > 2)
                      .map((tag) {
                    return FilterChip(
                      labelPadding: const EdgeInsets.all(1.0),
                      padding: const EdgeInsets.all(5.0),
                      label: CustomTextWidget(text: tag.trim(), size: 12, colorText: Colors.black),
                      selected: _selectedTags.contains(tag.trim()),
                      selectedColor: Colors.blue,
                      backgroundColor: Get.isDarkMode ? Colors.blueGrey.shade200 : Colors.grey.shade200,
                      shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedTags.add(tag.trim());
                          } else {
                            _selectedTags.remove(tag.trim());
                          }
                        });
                      },
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


  List<String> get selectedTags => _selectedTags.toList();
}
