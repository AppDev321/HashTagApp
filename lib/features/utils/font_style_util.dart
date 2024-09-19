import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hashtag/gen/assets.gen.dart';

class FontConverterUtil {
  late Map<String, Map<String, String>> fontMappings;
  late Map<String, String> currentMapping;
  late List<dynamic> fonts;

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

      // Use runes directly to avoid unnecessary conversions
      List<String> charactersSmall = lower.runes.map((int code) => String.fromCharCode(code)).toList();
      List<String> charactersBig = upper.runes.map((int code) => String.fromCharCode(code)).toList();

      // Map lowercase letters
      for (int i = 0; i < 26; i++) {
        invertedMap[String.fromCharCode(97 + i)] = charactersSmall[i]; // a-z
        invertedMap[String.fromCharCode(65 + i)] = charactersBig[i]; // A-Z
      }

      // Map digits if present
      if (font.containsKey('fontDigits')) {
        final String digits = font['fontDigits'];
        List<String> charactersDigits = digits.runes.map((int code) => String.fromCharCode(code)).toList();

        for (int i = 0; i < charactersDigits.length; i++) {
          invertedMap["$i"] = charactersDigits[i]; // Mapping digits
        }
      }
      fontMappings[fontId] = invertedMap;
    }
  }

  String convertText(String input, String fontId) {
    if (fontMappings.containsKey(fontId)) {
      currentMapping = fontMappings[fontId]!;
      StringBuffer output = StringBuffer(); // Use StringBuffer for performance

      for (int i = 0; i < input.length; i++) {
        String char = input[i];
        String mappedChar = currentMapping[char] ?? char; // Keep original if no mapping found
        output.write(mappedChar);
      }
      return output.toString();
    } else {
      throw Exception('Font ID not found');
    }
  }
}
