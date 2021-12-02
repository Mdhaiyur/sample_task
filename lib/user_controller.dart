import 'package:get/get.dart';

class UserController extends GetxController {
  List gender = ["Male", "Female"];
  late String selectGender = '';

  updateGender(String gender) {
    selectGender = gender;
    update();
  }
}
