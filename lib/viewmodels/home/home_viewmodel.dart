import 'package:get/get.dart';
import 'package:sample_task/data/local/database_provider.dart';
import 'package:sample_task/repository/user_repository_imp.dart';

class HomeViewModel extends GetxController {
  DatabaseProvider dbProvider = DatabaseProvider.get;
  var mlistUser = [].obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() {
    UserRepositoryImp(dbProvider).getAllUsers().then((value) {
      mlistUser.clear();
      mlistUser.addAll(value);
    });
  }

}
