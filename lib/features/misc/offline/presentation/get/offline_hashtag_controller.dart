import 'package:get/get.dart';
import 'package:hashtag/core/utils/custom_logs.dart';
import 'package:hashtag/features/misc/offline/data/repositories/hash_tag_db_repo.dart';
import 'package:hashtag/features/misc/offline/domain/entities/hashtag_entitiy.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/database/database_helper.dart';
class OfflineHashTagController extends GetxController {
  late HashTagDbRepository dbRepository;
  late Database mDatabaseHelper;

  var isDataLoading = false.obs;
  var offlineTagList = <HashTagEntity>[].obs;
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

  Future<void> getTagsByCategory(String categoryName) async {
    isDataLoading.value = true;
    update([widgetKey]);
    var dataList = await dbRepository.getTagsByCategory(categoryName);
    offlineTagList.value = dataList;
    isDataLoading.value = false;
    update([widgetKey]);
  }
}
