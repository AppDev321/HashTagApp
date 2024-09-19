import 'package:get/get.dart';
import 'package:hashtag/core/constants/app_strings.dart';

import '../../../../utils/font_style_util.dart';

class FontStyleController extends GetxController {
  FontConverterUtil fontConverterUtil = FontConverterUtil();
  var fontList = <dynamic>[].obs;
  var inputText = AppStrings.fontStyleType.obs;

  @override
  void onReady() async {
    super.onReady();
    await fontConverterUtil.loadFonts();
    fontList.assignAll(fontConverterUtil.fonts); // Update the observable list
    update();
  }

  String getConvertedStyleFontText(String text, String fontID) {
    return fontConverterUtil.convertText(text, fontID);
  }

  updateInputValue(String value) {
    if (value.isNotEmpty) {
      inputText.value = value;
    } else {
      inputText.value = AppStrings.fontStyleType;
    }
    update();
  }
}
