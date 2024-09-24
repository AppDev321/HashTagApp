import 'package:hashtag/features/misc/offline/domain/entities/hashtag_entitiy.dart';
import 'package:sqflite/sqflite.dart';
class HashTagDbRepository {
  final Database database;

  HashTagDbRepository(this.database);

  Future<List<HashTagEntity>> fetchTagsByCategory(String categoryName) async {
    final List<Map<String, dynamic>> maps = await database.query(
      'hashtag',
      where: 'category = ?',
      whereArgs: [categoryName],
    );
    return List.generate(maps.length, (i) {
      return HashTagEntity.fromMap(maps[i]);
    });
  }
}
