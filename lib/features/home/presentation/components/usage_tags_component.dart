import 'package:flutter/material.dart';
import 'package:hashtag/core/api/domain/entities/common_tags_data_model.dart';
import 'package:hashtag/core/utils/widget_extensions.dart';
import 'package:hashtag/features/misc/offline/presentation/component/custom_chip.dart';

import '../../../../core/utils/app_config_service.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../event_bus.dart';
import '../../../utils/common_utils.dart';

class UsageTagListComponent extends StatefulWidget {
  final List<CommonTags> tagList;

  const UsageTagListComponent({super.key, required this.tagList});

  @override
  _UsageTagListComponentState createState() => _UsageTagListComponentState();
}

class _UsageTagListComponentState extends State<UsageTagListComponent> {

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
          final isSelected = ConfigService.selectedTags.contains(tag);
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
                        if (ConfigService.selectedTags.contains(tag.trim())) {
                          ConfigService.selectedTags.remove(tag.trim());
                        } else {
                          ConfigService.selectedTags.add(tag.trim());
                        }
                        eventBus.fire(HashButtonUpdate());

                      });
                    },
                  )

                ]),
                CustomTextWidget(text: formatNumber(data.usage),size: 12,),
              ],
            ),
          );
        });


  }

}
