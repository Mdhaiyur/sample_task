import 'package:sample_task/database/user_repository.dart';
import 'package:sample_task/model/user_dao.dart';
import 'package:sample_task/model/user_model.dart';

import 'database_provider.dart';

class UsersDatabaseRepository implements UsersRepository {
  final dao = UserDao();

  @override
  DatabaseProvider? databaseProvider;

  UsersDatabaseRepository(this.databaseProvider);

  @override
  Future<void> insert(UserModel note) async {
    final db = await databaseProvider?.db();
    try {
      await db?.insert(dao.tableName, dao.toMap(note));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final db = await databaseProvider?.db();
    List<Map<dynamic,dynamic>> maps = (await db?.rawQuery('SELECT * FROM ${dao.tableName}'))!.cast<Map>();
    return dao.fromList(maps);
  }
}
