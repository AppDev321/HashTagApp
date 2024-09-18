import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hashtag/features/misc/fontstyle/presentation/get/font_style_controller.dart';

class FontStyleScreen extends GetView<FontStyleController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Styles"),
      ),

    );
  }



}