class HashTagEntity {
  final int id;
  final String mainText;
  final String tags;
  final int isSaved; // Use int for boolean values (0 for false, 1 for true)
  final String category;

  HashTagEntity({
    required this.id,
    required this.mainText,
    required this.tags,
    required this.isSaved,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mainText': mainText,
      'tags': tags,
      'isSaved': isSaved,
      'category': category,
    };
  }

  factory HashTagEntity.fromMap(Map<String, dynamic> map) {
    return HashTagEntity(
      id: map['id'],
      mainText: map['mainText'],
      tags: map['tags'],
      isSaved: map['isSaved'],
      category: map['category'],
    );
  }
}
