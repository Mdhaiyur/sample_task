import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/education/user_education_view.dart';

class PersonalDetailsViewModel extends ChangeNotifier {
  List gender = ["Male", "Female"];
  late String selectGender = '';
  Uint8List? profilePhoto;
  var currentUser = UserModel();
  bool passwordVisible = false;

  updateGender(String gender) {
    selectGender = gender;
    notifyListeners();
  }

  updatePasswordVisibility(bool visibility) {
    passwordVisible = visibility;
    notifyListeners();
  }

  updateUserProfile(Uint8List profilePhoto) {
    this.profilePhoto = profilePhoto;
    notifyListeners();
  }

  saveUserRegisterDetails(String firstName, String lastName, String phoneNumber,
      String email, password) {
    currentUser.firstName = firstName;
    currentUser.lastName = lastName;
    currentUser.mobileNumber = phoneNumber;
    currentUser.email = email;
    currentUser.gender = selectGender;
    currentUser.password = password;
    currentUser.profilePhoto = profilePhoto;

    Get.put<UserModel>(currentUser);
    Get.to(UserInfoPage());
  }
}
