import 'package:get/get.dart';

import '../../../../utils/caption_util.dart';

class CaptionController extends GetxController {
  final CaptionUtil captionUtil = Get.find();

  final captionGenre = Get.find<CaptionUtil>().getUniqueGenres();

  String formatString(String input) {
    return input
        .split(',') // Split by comma
        .map((word) => word.trim()) // Trim spaces
        .map((word) {
      // Capitalize the first letter of each word
      return word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}' : '';
    }).join(' '); // Join with a space
  }

  List<Quote> getQuotesByGenre(String genre) {
    return captionUtil.getQuotesByGenre(genre);
  }
}
