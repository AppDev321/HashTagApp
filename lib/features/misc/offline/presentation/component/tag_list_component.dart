import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';

import '../../../../../core/widgets/custom_text_widget.dart';
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
                    final isSelected = _selectedTags.contains(tag.trim());
                    return RepaintBoundary( // Helps with performance
                      child: CustomChip(
                        label: tag.trim(),
                        isSelected: _selectedTags.contains(tag.trim()),
                        onSelected: () {
                          setState(() {
                            if (_selectedTags.contains(tag.trim())) {
                              _selectedTags.remove(tag.trim());
                            } else {
                              _selectedTags.add(tag.trim());
                            }
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

  List<String> get selectedTags => _selectedTags.toList();
}
