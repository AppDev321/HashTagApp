import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class GradientSearchBox extends StatelessWidget {
  final Function(String)? onChanged;
  const GradientSearchBox({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(color: AppColors.hexToColor("#A8E6ce").withOpacity(0.6), offset: const Offset(1.1, 4.0), blurRadius: 8.0),
        ],
        gradient: LinearGradient(
          colors: [
            AppColors.hexToColor("#A8E6ce"),
            AppColors.hexToColor("#dcedc2"),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CustomTextField(
          borderEnable: false,
          text: AppStrings.searchTag,
          fontWeight: FontWeight.normal,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
