import 'package:equatable/equatable.dart';

class CommonTags extends Equatable {
  const CommonTags({
    required this.id,
    required this.tag,
    required this.usage,
  });

  final int id;
  final String tag;
  final num usage;

  factory CommonTags.fromJson(Map<String, dynamic> json) {
    return CommonTags(
      id: json["id"] ?? 0,
      tag: json["tag"] ?? "",
      usage: json["usage"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
        "usage": usage,
      };

  @override
  List<Object?> get props => [
        id,
        tag,
        usage,
      ];
}
