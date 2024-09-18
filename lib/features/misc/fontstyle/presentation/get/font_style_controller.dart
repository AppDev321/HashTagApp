import 'package:get/get.dart';

import '../../../../utils/font_style_util.dart';

class FontStyleController extends GetxController {
  FontConverterUtil fontConverterUtil = FontConverterUtil();

  @override
  void onReady() async {
    super.onReady();
    await fontConverterUtil.loadFonts();
  }

  String getConvertedStyleFontText(String text, String fontID) {
    return fontConverterUtil.convertText(text, fontID);
  }
}
