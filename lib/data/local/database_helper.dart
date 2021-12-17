import 'package:sample_task/data/local/database_provider.dart';

class DatabaseHelper {
  static const _databaseName = "user.db";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static AppDatabase? _database;

  Future<AppDatabase?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await $FloorAppDatabase.databaseBuilder(_databaseName).build();
  }
}
