import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/utils/utils.dart';
import 'package:sample_task/view/widget/custom_button.dart';
import 'package:sample_task/view/widget/custom_textfield.dart';
import 'package:sample_task/viewmodels/education/education_viewmodel.dart';

class UserInfoPage extends GetView<EducationViewModel> {
  TextEditingController yearOfPassing = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController domain = TextEditingController();


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
          "Your Info",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Education Info',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Education*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                    value: controller.educationList[0],
                    onChanged: (newValue) {
                      controller.selectedEducation != newValue;
                    },
                    items: controller.educationList.map((classType) {
                      return DropdownMenuItem(
                          value: classType.toString(),
                          child: Text(classType.toString()));
                    }).toList()),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    label: "Year of Passing*",
                    hint: "Enter year of Passing",
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: yearOfPassing,
                    regExp: "[0-9]"),
                CustomTextField(
                    label: "University",
                    hint: "Enter your university",
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: university,
                    regExp: "[a-zA-Z ]"),
                CustomTextField(
                    label: "Grade*",
                    hint: "Enter your grade of percentage",
                    inputType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: grade,
                    regExp: "[a-zA-Z0-9 ]"),
                Text(
                  'Professional Info',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                    label: "Experience*",
                    hint: "Enter the year of experience",
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: experience,
                    regExp: "[0-9]"),
                CustomTextField(
                    label: "Designation*",
                    hint: "Enter Designation",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: designation,
                    regExp: "[a-zA-Z ]"),
                CustomTextField(
                    label: "Domain*",
                    hint: "Enter your Domain",
                    inputType: TextInputType.name,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: domain,
                    regExp: "[a-zA-Z0-9 ]"),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Previous',
                        borderColor: Colors.deepPurpleAccent,
                        textColor: Colors.deepPurpleAccent,
                        primaryColor: Colors.white,
                        radius: 10,
                        onPress: () => Get.back(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: 'Next',
                        borderColor: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                        radius: 10,
                        primaryColor: Colors.deepPurpleAccent,
                        onPress: () => _verifyUserInfo(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyUserInfo() {
    if (yearOfPassing.text.trim().isEmpty) {
      Utils().showSnackbar("Year of Passing must be entered");
    } else if (university.text.trim().isEmpty) {
      Utils().showSnackbar("University must be entered");
    } else if (grade.text.trim().isEmpty) {
      Utils().showSnackbar("Grade must be entered");
    } else if (experience.text.trim().isEmpty) {
      Utils().showSnackbar("Experience must be entered");
    } else if (designation.text.trim().isEmpty) {
      Utils().showSnackbar("Designation must be entered");
    } else if (domain.text.trim().isEmpty) {
      Utils().showSnackbar("Designation must be entered");
    } else {
      controller.saveUserEducationInfo(
          yearOfPassing.text.trim().toString(),
          university.text.trim().toString(),
          grade.text.trim().toString(),
          experience.text.trim().toString(),
          designation.text.trim().toString(),
          domain.text.trim().toString());
    }
  }
}
