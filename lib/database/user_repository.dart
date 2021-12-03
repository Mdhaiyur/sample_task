
import 'package:sample_task/model/user_model.dart';

import 'database_provider.dart';

abstract class UsersRepository {
  DatabaseProvider? databaseProvider;

  Future<void> insert(UserModel user);

  Future<List<UserModel>> getAllUsers();

}