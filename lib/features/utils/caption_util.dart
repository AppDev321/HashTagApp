import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hashtag/gen/assets.gen.dart';

class Quote {
  final String quote;
  final String author;
  final String genre;

  Quote({required this.quote, required this.author, required this.genre});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quote: json['quote'],
      author: json['author'],
      genre: json['genre'],
    );
  }
}

class CaptionUtil extends GetxController {
  late List<Quote> captionList;

  @override
  void onReady() async {
    super.onReady();
    await loadCaptionFile();
  }

  Future<void> loadCaptionFile() async {
    String jsonData = await rootBundle.loadString(Assets.json.quotes);
    var jsonData2 = json.decode(jsonData) as List<dynamic>;
    captionList = jsonData2.map((data) => Quote.fromJson(data)).toList().cast<Quote>();
  }


  List<String> getUniqueGenres() {
    return captionList.map((quote) => quote.genre).toSet().toList();
  }

  List<Quote> getQuotesByGenre(String genre) {
    return captionList.where((quote) => quote.genre == genre).toList();
  }

}
