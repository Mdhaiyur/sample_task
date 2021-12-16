import 'dart:async';
import 'dart:typed_data';

import 'package:floor/floor.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/repository/user_repository_.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database_provider.g.dart';

@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
