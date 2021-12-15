import 'package:get/get.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/address/user_address_view.dart';

class EducationViewModel extends GetxController {
  var currentUser;

  String selectedEducation='';
  List<String> educationList = [
    'PostGraduate',
    'Graduate',
    'HSC',
    'Diploma',
    'SSC'
  ];

  saveUserEducationInfo(
      String yearofPassing,
      String university,
      String grade,
      String experience,
      String designation,
      String domain) {
    currentUser.education = selectedEducation;
    currentUser.yearOfPassing = yearofPassing;
    currentUser.university = university;
    currentUser.grade = grade;
    currentUser.yearOfExperience = experience;
    currentUser.designation = designation;
    currentUser.domain = domain;

    Get.put<UserModel>(currentUser);
    Get.to(UserAddressPage());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentUser=Get.find<UserModel>();
  }
}
