import 'package:get/get.dart';
import 'package:hashtag/features/misc/offline/data/repositories/hash_tag_db_repo.dart';
import 'package:hashtag/features/misc/offline/domain/entities/hashtag_entitiy.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/database/database_helper.dart';
class OfflineHashTagController extends GetxController {
  late HashTagDbRepository dbRepository;
  late Database mDatabaseHelper;

  final String widgetKey = "updateOfflineListWidget";

  @override
  void onReady() {
    super.onReady();
    someDatabaseOperation();
  }

  void someDatabaseOperation() async {
    mDatabaseHelper = await Get.find<DatabaseHelper>().database;
    dbRepository = HashTagDbRepository(mDatabaseHelper);
  }

  Future<List<HashTagEntity>> getTagsByCategory(String categoryName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final dataList = await dbRepository.fetchTagsByCategory(categoryName);
   return dataList;
  }
}
