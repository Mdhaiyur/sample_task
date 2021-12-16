
import 'package:floor/floor.dart';
import 'package:sample_task/model/user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM UserModel')
  Future<List<UserModel>> getAllUsers();

  @insert
  Future<void> insertUser(UserModel person);
}