import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hashtag/gen/assets.gen.dart';

class FontConverterUtil {
  late Map<String, Map<String, String>> fontMappings;
  late Map<String, String> currentMapping;
  late List<dynamic> fonts ;
  FontConverterUtil() {
    fontMappings = {};
  }

  Future<void> loadFonts() async {
     String jsonData = await rootBundle.loadString(Assets.json.fontStyle);
    var jsonData2 = json.decode(jsonData);
    _loadFonts(jsonData2["fonts"]);
  }

  void _loadFonts(dynamic jsonData) {
    fonts = jsonData;
    for (var font in fonts) {
      final String fontId = font['id'];
      final String lower = font['fontLower'];
      final String upper = font['fontUpper'];
      final Map<String, String> invertedMap = {};

      // Create the mapping for lowercase
      for (int i = 0; i < 26; i++) {
        invertedMap[String.fromCharCode(97 + i)] = lower[i]; // a-z
      }
      // Create the mapping for uppercase
      for (int i = 0; i < 26; i++) {
        invertedMap[String.fromCharCode(65 + i)] = upper[i]; // A-Z
      }
      // Check if digits are present before mapping
      if (font.containsKey('fontDigits')) {
        final String digits = font['fontDigits'];
        for (int i = 0; i < digits.length; i++) {
          invertedMap[digits[i]] = digits[i]; // Mapping digits
        }
      }

      // Store the inverted map for this font ID
      fontMappings[fontId] = invertedMap;
    }
  }

  String convertText(String input, String fontId) {
    if (fontMappings.containsKey(fontId)) {
      currentMapping = fontMappings[fontId]!;
      String output = '';
      for (int i = 0; i < input.length; i++) {
        String char = input[i];
        output += currentMapping[char] ?? char; // Keep original if no mapping found
      }
      return output;
    } else {
      throw Exception('Font ID not found');
    }
  }
}
