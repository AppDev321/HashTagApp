import 'package:flutter/material.dart';
import 'package:hashtag/core/widgets/button_widget.dart';

class AnimatedSearchButton extends StatefulWidget {
  const AnimatedSearchButton({super.key});

  @override
  _AnimatedSearchButtonState createState() => _AnimatedSearchButtonState();
}

class _AnimatedSearchButtonState extends State<AnimatedSearchButton>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Container(
          decoration: ShapeDecoration(
            color: Colors.red.withOpacity(0.2),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              8.0 * animationController.value,
            ),
            child: child,
          ),
        );
      },
      child: ButtonWidget(text: "Generate HashTag", buttonType: ButtonType.fill,color: Colors.red.withOpacity(0.8),width: 200,),

    );
  }
}