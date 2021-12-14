import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_task/utils/utils.dart';
import 'package:sample_task/view/widget/custom_button.dart';
import 'package:sample_task/view/widget/custom_textfield.dart';
import 'package:sample_task/viewmodels/personaldeatails/personaldetails_viewmodel.dart';

class UserRegisterPage extends StatelessWidget {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final PersonalDetailsViewModel userController =
      Get.put(PersonalDetailsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        leading: const BackButton(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "Register",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        GetBuilder<PersonalDetailsViewModel>(
                          init: userController,
                          builder: (value) => CircleAvatar(
                              radius: 50,
                              child: userController.profilePhoto != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(60.0),
                                      child: Image.memory(
                                        userController.profilePhoto!,
                                        width: 115,
                                        height: 115,
                                        fit: BoxFit.fill,
                                      ))
                                  : Container()),
                        ),
                        Positioned(
                            bottom: 25,
                            right: -50,
                            child: RawMaterialButton(
                              onPressed: () {
                                _showAlertDialog(context);
                              },
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: const Icon(
                                Icons.edit,
                                color: Colors.deepPurpleAccent,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              shape: const CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                    label: "First Name*",
                    hint: "Enter your first name here",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: firstName,
                    regExp: "[a-zA-Z]",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.deepPurpleAccent,
                    )),
                CustomTextField(
                    label: "Last Name*",
                    hint: "Enter your last name here",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: lastName,
                    regExp: "[a-zA-Z]",
                    prefixIcon: const Icon(Icons.person,
                        color: Colors.deepPurpleAccent)),
                CustomTextField(
                    label: "Phone Number*",
                    hint: "Enter your 10 digit phone number",
                    inputType: TextInputType.phone,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: phoneNumber,
                    regExp: "[0-9]",
                    prefixIcon: const Icon(Icons.phone,
                        color: Colors.deepPurpleAccent)),
                CustomTextField(
                    label: "Email*",
                    hint: "Your email goes here",
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    obscureText: false,
                    regExp: '',
                    controller: email,
                    prefixIcon: const Icon(Icons.email,
                        color: Colors.deepPurpleAccent)),
                Text(
                  'Gender*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: <Widget>[
                    genderRadioButtons(0, 'Male'),
                    genderRadioButtons(1, 'Female'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<PersonalDetailsViewModel>(
                    init: userController,
                    builder: (value) => CustomTextField(
                          label: "Password*",
                          hint: "Password",
                          inputType: TextInputType.visiblePassword,
                          inputAction: TextInputAction.next,
                          obscureText: !userController.passwordVisible,
                          regExp: '',
                          controller: password,
                          prefixIcon: const Icon(Icons.email,
                              color: Colors.deepPurpleAccent),
                          suffixIcon: IconButton(
                            icon: Icon(
                              userController.passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.deepPurpleAccent,
                            ),
                            onPressed: () {
                              userController.updatePasswordVisibility(
                                  !userController.passwordVisible);
                            },
                          ),
                        )),
                CustomTextField(
                    label: "Confirm Password*",
                    hint: "Password",
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                    obscureText: true,
                    regExp: '',
                    controller: confirmPassword,
                    prefixIcon: const Icon(Icons.email,
                        color: Colors.deepPurpleAccent)),
                CustomButton(
                  text: 'Next',
                  borderColor: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  radius: 10,
                  primaryColor: Colors.deepPurpleAccent,
                  onPress: () => _verifyUserRegister(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row genderRadioButtons(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GetBuilder<PersonalDetailsViewModel>(
          init: userController,
          builder: (value) => Radio(
            activeColor: Colors.deepPurpleAccent,
            value: userController.gender[btnValue].toString(),
            groupValue: userController.selectGender,
            onChanged: (value) {
              userController.updateGender(value.toString());
            },
          ),
        ),
        Text(title)
      ],
    );
  }

  _verifyUserRegister() {
    if (firstName.text.trim().isEmpty) {
      Utils().showSnackbar("First Name must be entered.");
    } else if (firstName.text.trim().length < 4) {
      Utils().showSnackbar("First Name must Contain Atleast 4 Characters.");
    } else if (lastName.text.trim().isEmpty) {
      Utils().showSnackbar("Last Name must be entered.");
    } else if (lastName.text.trim().length < 4) {
      Utils().showSnackbar("Last Name must Contain Atleast 4 Characters.");
    } else if (phoneNumber.text.trim().isEmpty) {
      Utils().showSnackbar("Phone Number must be entered.");
    } else if (phoneNumber.text.trim().length != 10) {
      Utils().showSnackbar("Phone Number must be valid number.");
    } else if (email.text.trim().isEmpty) {
      Utils().showSnackbar("Email must be entered.");
    } else if (!Utils().isEmailValid(email.text.trim())) {
      Utils().showSnackbar("Email must be valid.");
    } else if (userController.selectGender == '') {
      Utils().showSnackbar("Gender must be selected.");
    } else if (password.text.trim().isEmpty) {
      Utils().showSnackbar("Password must be entered.");
    } else if (!Utils().validatePassword(password.text.trim())) {
      Utils().showSnackbar("Password must be valid.");
    } else if (confirmPassword.text.trim().isEmpty) {
      Utils().showSnackbar("Confirm Password must be entered.");
    } else if (password.text.trim() != confirmPassword.text.trim()) {
      Utils().showSnackbar("Password and Confirm Password must be same.");
    } else {
      userController.saveUserRegisterDetails(
          firstName.text.toString(),
          lastName.text.toString(),
          phoneNumber.text.toString(),
          email.text.toString(),
          password.text.toString());
    }
  }

  _showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "Cancel",
        style: GoogleFonts.poppins(fontSize: 14),
      ),
      onPressed: () {
        Get.back();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        "Select option",
        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      content: Wrap(
        direction: Axis.vertical,
        children: [
          InkWell(
            onTap: () async {
              final pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
              pickedFile!.readAsBytes().then((value) {
                userController.updateUserProfile(value);
              });
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Camera"),
            ),
          ),
          InkWell(
            onTap: () async {
              final pickedFile =
                  await _picker.pickImage(source: ImageSource.gallery);
              pickedFile!.readAsBytes().then((value) {
                userController.updateUserProfile(value);
              });
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Gallery"),
            ),
          )
        ],
      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
