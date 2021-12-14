import 'package:sample_task/data/local/database_provider.dart';
import 'package:sample_task/model/user_dao.dart';
import 'package:sample_task/model/user_model.dart';

import 'user_repository.dart';

class UserRepositoryImp implements UsersRepository {
  final dao = UserDao();

  @override
  DatabaseProvider? databaseProvider;

  UserRepositoryImp(this.databaseProvider);

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
