import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';

import '../../../../core/widgets/custom_text_widget.dart';
import '../../../utils/common_utils.dart';

class UsageTagListComponent extends StatefulWidget {
  final List<CommonTags> tagList;
  final String categoryName;

  const UsageTagListComponent({super.key, required this.tagList, required this.categoryName});

  @override
  _UsageTagListComponentState createState() => _UsageTagListComponentState();
}

class _UsageTagListComponentState extends State<UsageTagListComponent> {
  final Set<String> _selectedTags = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.tagList.sort((a, b) => b.usage.compareTo(a.usage));

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tagList.length,
        itemBuilder: (context, index) {
          var data = widget.tagList[index];
          var tag = data.tag;
          final isSelected = _selectedTags.contains(tag);
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CustomTextWidget(text: '${index + 1}',size: 12,),
                  CustomSizeBox.width(10),
                  CustomChip(
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
                  )

                ]),
                CustomTextWidget(text: formatNumber(data.usage),size: 12,),



              ],
            ),
          );
        });

    Card(
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
                tagCount: formatNumber(data.usage.toInt()),
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
    );
  }

  List<String> get selectedTags => _selectedTags.toList();
}
