import 'package:equatable/equatable.dart';
import 'common_tags_data_model.dart';

class SearchApiResponse extends Equatable {
  final List<CommonTags> best;
  final List<CommonTags> top;
  final List<CommonTags> recommended;
  final List<CommonTags> exact;
  final List<CommonTags> popular;
  final List<CommonTags> related;

  const SearchApiResponse({
    required this.best,
    required this.top,
    required this.recommended,
    required this.exact,
    required this.popular,
    required this.related,
  });

  factory SearchApiResponse.fromJson(Map<String, dynamic> json) {
    return SearchApiResponse(
      best: json["best"] == null
          ? []
          : List<CommonTags>.from(json["best"].map((x) => CommonTags.fromJson(x))),
      top: json["top"] == null
          ? []
          : List<CommonTags>.from(json["top"].map((x) => CommonTags.fromJson(x))),
      recommended: json["recommended"] == null
          ? []
          : List<CommonTags>.from(json["recommended"].map((x) => CommonTags.fromJson(x))),
      exact: json["exact"] == null
          ? []
          : List<CommonTags>.from(json["exact"].map((x) => CommonTags.fromJson(x))), // Fixed
      popular: json["popular"] == null
          ? []
          : List<CommonTags>.from(json["popular"].map((x) => CommonTags.fromJson(x))),
      related: json["related"] == null
          ? []
          : List<CommonTags>.from(json["related"].map((x) => CommonTags.fromJson(x))), // Fixed
    );
  }

  Map<String, dynamic> toJson() => {
    "best": best.map((x) => x.toJson()).toList(),
    "top": top.map((x) => x.toJson()).toList(),
    "recommended": recommended.map((x) => x.toJson()).toList(),
    "exact": exact.map((x) => x.toJson()).toList(), // Fixed
    "popular": popular.map((x) => x.toJson()).toList(),
    "related": related.map((x) => x.toJson()).toList(),
  };

  @override
  List<Object?> get props => [
    best,
    top,
    recommended,
    exact,
    popular,
    related,
  ];
}
