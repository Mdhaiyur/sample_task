import 'package:get/get.dart';

class Utils {
  showSnackbar(String msg) {
    Get.showSnackbar(GetSnackBar(message: msg,duration: const Duration(milliseconds: 1000),isDismissible: true,));
  }
  bool isEmailValid(String email) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }
  bool validatePassword(String value) {
    bool hasDigits = value.contains(new RegExp(r'[0-9]'));
    bool hasSpecialCharacters = value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasDigits & hasSpecialCharacters;
  }

}
