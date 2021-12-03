import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/controller/user_controller.dart';
import 'package:sample_task/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class UserRegisterPage extends GetWidget<UserController> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final ImagePicker _picker = ImagePicker();

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
                        GetBuilder<UserController>(
                          init: controller,
                          builder: (value) => CircleAvatar(
                              radius: 50,
                              child: controller.profilePhoto != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(60.0),
                                      child: Image.memory(
                                        controller.profilePhoto!,
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
                              padding: EdgeInsets.all(10.0),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                Text(
                  'First Name*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: firstName,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.deepPurpleAccent,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your first name here",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Last Name*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: lastName,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  ],
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                          color: Colors.deepPurpleAccent),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your last name here",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Phone Number*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: phoneNumber,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone,
                          color: Colors.deepPurpleAccent),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter your 10 digit phone number",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Email*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: email,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Your email goes here",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                Text(
                  'Password*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GetBuilder<UserController>(
                  init: controller,
                  builder: (value) => TextFormField(
                    controller: password,
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.black,
                    obscureText: !controller.passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.deepPurpleAccent,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.deepPurpleAccent,
                          ),
                          onPressed: () {
                            controller.updatePasswordVisibility(
                                !controller.passwordVisible);
                          },
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurpleAccent, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurpleAccent, width: 1.0),
                        ),
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Password",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Confirm Password*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: confirmPassword,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.deepPurpleAccent),
                  onPressed: () {
                    _verifyUserRegister();
                  },
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
        GetBuilder<UserController>(
          init: controller,
          builder: (value) => Radio(
            activeColor: Colors.deepPurpleAccent,
            value: controller.gender[btnValue].toString(),
            groupValue: controller.selectGender,
            onChanged: (value) {
              controller.updateGender(value.toString());
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
    } else if (controller.selectGender == '') {
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
      controller.saveUserRegisterDetails(
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
                controller.updateUserProfile(value);
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
                controller.updateUserProfile(value);
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
