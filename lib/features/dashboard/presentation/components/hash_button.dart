import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hashtag/core/utils/utils.dart';
import 'package:hashtag/core/widgets/custom_text_widget.dart';
import 'package:hashtag/features/home/presentation/components/avatar_glow.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/utils/app_config_service.dart';
import '../../../../event_bus.dart';
import '../../../../routes/app_pages.dart';

class HashButton extends StatefulWidget {
  const HashButton({super.key});

  @override
  _HashButtonState createState() => _HashButtonState();
}

class _HashButtonState extends State<HashButton> {
  int tagCount = ConfigService.selectedTags.length;
  late StreamSubscription<HashButtonUpdate> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = eventBus.on<HashButtonUpdate>().listen((event) {
      if (mounted) {
        setState(() {
          tagCount = ConfigService.selectedTags.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(1.4, -1.5),
        children: [
          AvatarGlow(
            glowRadiusFactor: 0.4,
            glowColor: AppColors.hexToColor("#617388"),
            glowShape: BoxShape.circle,
            repeat: true,
            animate: tagCount > 0 ? true : false,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                if (tagCount > 0) {
                  Get.toNamed(AppPages.ON_EDIT_TAG);

                } else {
                  showSnackBar(context, "No tag selected");
                }
              },
              backgroundColor: AppColors.hexToColor("#617388"),
              child: const Icon(
                Icons.tag,
                color: Colors.white,
              ),
            ),
          ),
          if (tagCount > 0) _buildBadge(),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5, color: Colors.black.withAlpha(50))],
        borderRadius: BorderRadius.circular(100),
        color: Colors.redAccent.shade200,
      ),
      child: Center(
        child: CustomTextWidget(
          text: tagCount.toString(),
          size: 14,
          colorText: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel(); // Cancel the subscription
    super.dispose();
  }
}
