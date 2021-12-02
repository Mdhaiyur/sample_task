import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../user_controller.dart';

class UserRegisterPage extends StatelessWidget {
  UserController userController = Get.find();

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
                Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                      offset: Offset(10.0, 10.0),
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
                width: 200,
                height: 200,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Container 1',
                    style:
                    TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                ),]),
                Text(
                  'First Name*',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepPurpleAccent,
                      ),
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
                      hintText: "Enter your first name here",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                SizedBox(
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.person, color: Colors.deepPurpleAccent),
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.phone, color: Colors.deepPurpleAccent),
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
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
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
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
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
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
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepPurpleAccent,
                      ),
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
                    // Get.to(UserRegisterPage());
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
          init: UserController(),
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
}
