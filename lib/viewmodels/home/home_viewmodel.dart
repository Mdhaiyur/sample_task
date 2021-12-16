import 'package:get/get.dart';
import 'package:sample_task/data/local/database_helper.dart';
import 'package:sample_task/data/local/database_provider.dart';

class HomeViewModel extends GetxController {
  var mlistUser = [].obs;
  AppDatabase? database;

  @override
  Future<void> onInit() async {
    super.onInit();
    database = await DatabaseHelper.instance.database;
    getUserData();
  }

  getUserData() {
    database!.userDao.getAllUsers().then((value) {
      mlistUser.clear();
      mlistUser.addAll(value);
    });
  }
}
