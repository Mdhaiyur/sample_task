import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/controller/user_controller.dart';
import 'package:sample_task/utils/utils.dart';



class UserInfoPage extends GetWidget<UserController> {
  TextEditingController yearOfPassing = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController grade = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController domain = TextEditingController();

  List<String> educationList=[ 'PostGraduate', 'Graduate', 'HSC', 'Diploma', 'SSC'];

  @override
  Widget build(BuildContext context) {
    String educationSelection=educationList[0];

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
                SizedBox(
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
                    decoration:const InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepPurpleAccent, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      contentPadding:  EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                    ),
                    value: educationSelection,
                    onChanged: (newValue) {
                      print(newValue);
                      educationSelection!=newValue;
                    },
                    items: educationList.map((classType) {
                      return DropdownMenuItem(
                          value: classType.toString(),
                          child: Text(classType.toString()));
                    }).toList()),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Year of Passing*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  controller: yearOfPassing,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter year of Passing",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'University',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  controller: university,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter your university",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Grade*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: grade,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter your grade of percentage",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Professional Info',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Experience*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  controller: experience,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter the year of experience",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Designation*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: designation,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter Designation",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Domain*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: domain,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),
                  ],
                  decoration: InputDecoration(
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
                      hintText: "Enter your Domain",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          'Previous',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurpleAccent),
                        ),
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.5, color: Colors.deepPurpleAccent),
                            elevation: 0,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.deepPurpleAccent),
                        onPressed: () {
                          _verifyUserInfo(educationSelection);
                          //  Get.to(UserAddressPage());
                        },
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

  _verifyUserInfo(String education) {
    print(controller.currentUser.firstName);

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
          education,
          yearOfPassing.text.trim().toString(),
          university.text.trim().toString(),
          grade.text.trim().toString(),
          experience.text.trim().toString(),
          designation.text.trim().toString(),
          domain.text.trim().toString());
    }
  }
}
