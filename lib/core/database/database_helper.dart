import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:hashtag/core/utils/custom_logs.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "hashtag.db");
    var exists = await databaseExists(path);

    if (!exists) {
      CustomLogger.log("Creating new copy from asset",object: this);
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "json/hashtag.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      CustomLogger.log("Opening existing database",object: this);
    }
    var bomDataTable = await openDatabase(path, readOnly: true);
    return bomDataTable;
  }
}
