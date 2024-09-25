import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/best_tags.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';


class TagListComponent extends StatefulWidget {
  final List<CommonTags> tagList;
  final String categoryName;

  const TagListComponent({super.key, required this.tagList, required this.categoryName});

  @override
  _TagListComponentState createState() => _TagListComponentState();
}

class _TagListComponentState extends State<TagListComponent> {
  final Set<String> _selectedTags = {};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              const SizedBox(height: 10),
              Wrap(
                  children: widget.tagList.map((data) {
                var tag = data.tag;
                final isSelected = _selectedTags.contains(tag);
                return CustomChip(
                  label: tag,
                  isSelected: isSelected,
                  onSelected: () {
                    setState(() {
                      if (_selectedTags.contains(tag.trim())) {
                        _selectedTags.remove(tag.trim());
                      } else {
                        _selectedTags.add(tag.trim());
                      }
                    });
                  },
                );
              }).toList())
            ],
          ),
        ),
      ),
    );
  }

  List<String> get selectedTags => _selectedTags.toList();
}
