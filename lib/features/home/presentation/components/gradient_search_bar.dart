import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/custom_text_field.dart';

class GradientSearchBox extends StatefulWidget {
  const GradientSearchBox({super.key});

  @override
  _GradientSearchBoxState createState() => _GradientSearchBoxState();
}

class _GradientSearchBoxState extends State<GradientSearchBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(); // Repeat indefinitely

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: AppColors.hexToColor("#A8E6ce").withOpacity(0.6), offset: const Offset(1.1, 4.0), blurRadius: 8.0),
            ],
            gradient: LinearGradient(
              colors: [
                AppColors.hexToColor("#A8E6ce").withOpacity(_animation.value),
                AppColors.hexToColor("#dcedc2").withOpacity(1 - _animation.value),
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
              text: AppStrings.search,
              fontWeight: FontWeight.normal,
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }
}
