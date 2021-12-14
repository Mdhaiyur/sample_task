
import 'package:sample_task/data/local/database_provider.dart';
import 'package:sample_task/model/user_model.dart';

abstract class UsersRepository {
  DatabaseProvider? databaseProvider;

  Future<void> insert(UserModel user);

  Future<List<UserModel>> getAllUsers();

}