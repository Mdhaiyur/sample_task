import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_task/data/local/database_helper.dart';
import 'package:sample_task/data/local/database_provider.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/home/home_page.dart';

class AddressViewModel extends ChangeNotifier {
  AppDatabase? database;
  var currentUser;

  var selectedState;

  var cityList = [
    'Maharashtra',
    'Gujarat',
    'Karnataka',
    'Madhya Pradesh',
    'Delhi',
    'Others'
  ];

  AddressViewModel(){
    initData();
  }

  initData() async {
    database = await DatabaseHelper.instance.database;
    currentUser = Get.find<UserModel>();
  }

  saveUserAddress(String address, String landmark, String zipcode, String city,
      String state) async {
    currentUser.address = address;
    currentUser.locality = landmark;
    currentUser.zipcode = zipcode;
    currentUser.city = city;
    currentUser.state = selectedState;

    database!.userDao
        .insertUser(currentUser)
        .then((value) => Get.offAll(() => HomePage()));
  }
}
