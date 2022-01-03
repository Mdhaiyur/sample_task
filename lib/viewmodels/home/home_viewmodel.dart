import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_task/data/local/database_helper.dart';
import 'package:sample_task/data/local/database_provider.dart';

class HomeViewModel extends ChangeNotifier {
  var mlistUser = [].obs;
  AppDatabase? database;

  HomeViewModel(){
    initialize();
  }

  @override
  Future<void> initialize() async {
    database = await DatabaseHelper.instance.database;
    getUserData();
  }

  getUserData() {
    database!.userDao.getAllUsers().then((value) {
      mlistUser.clear();
      mlistUser.addAll(value);
      notifyListeners();
    });
  }
}
