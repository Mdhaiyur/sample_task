import 'package:get/get.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/address/user_address_view.dart';

class EducationViewModel extends GetxController {
  var currentUser = UserModel();

  updateCurrentUser(UserModel mUser) {
    currentUser = mUser;
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

    Get.to(UserAddressPage(mUser: currentUser,));
  }
}
