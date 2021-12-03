import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:sample_task/database/database_provider.dart';
import 'package:sample_task/database/user_database_repository.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/home_page.dart';
import 'package:sample_task/view/user_address_page.dart';
import 'package:sample_task/view/user_info_page.dart';

class UserController extends GetxController {
  List gender = ["Male", "Female"];
  late String selectGender = '';
  Uint8List? profilePhoto;
  var currentUser = UserModel();
  bool passwordVisible=false;

  DatabaseProvider dbProvider = DatabaseProvider.get;
  var mlistUser = [].obs;

  updateGender(String gender) {
    selectGender = gender;
    update();
  }

  updatePasswordVisibility(bool visibility) {
    passwordVisible = visibility;
    update();
  }

  updateUserProfile(Uint8List profilePhoto) {
    this.profilePhoto = profilePhoto;
    update();
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

    Get.to(UserInfoPage());
  }

  saveUserEducationInfo(
      String education,
      String yearofPassing,
      String university,
      String grade,
      String experience,
      String designation,
      String domain) {
    currentUser.education = education;
    currentUser.yearOfPassing = yearofPassing;
    currentUser.university = university;
    currentUser.grade = grade;
    currentUser.yearOfExperience = experience;
    currentUser.designation = designation;
    currentUser.domain = domain;

    Get.to(UserAddressPage());
  }

  saveUserAddress(String address, String landmark, String zipcode, String city,
      String state) async {
    currentUser.address = address;
    currentUser.locality = landmark;
    currentUser.zipcode = zipcode;
    currentUser.city = city;
    currentUser.state = state;

    UsersDatabaseRepository(dbProvider).insert(currentUser);

    await getUserData();
    Get.offAll(() => HomePage());

  }

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData(){
    UsersDatabaseRepository(dbProvider).getAllUsers().then((value) {
      mlistUser.clear();
      mlistUser.addAll(value);
    });
  }
}
