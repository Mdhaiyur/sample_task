import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/model/user_model.dart';
import 'package:sample_task/view/personaldetails/user_personal_details.dart';
import 'package:sample_task/view/widget/custom_button.dart';
import 'package:sample_task/viewmodels/home/home_viewmodel.dart';

import 'user_details_page.dart';

class HomePage extends GetView<HomeViewModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          "Users",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: GetX<HomeViewModel>(
                init: controller,
                builder: (controller) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.mlistUser.length,
                    itemBuilder: (context, index) {
                      return userCell(controller.mlistUser[index]);
                    },
                  );
                }),
          ),
          CustomButton(
            text: 'Register',
            borderColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            primaryColor: Colors.deepPurpleAccent,
            onPress: () => Get.to(UserRegisterPage()),
          ),
        ],
      )),
    );
  }

  userCell(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: Get.context!,
            builder: (_) => UserDetailsPage(user),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              child: user.profilePhoto == null
                  ? Image.asset('assets/images/user_placeholder.png')
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.memory(user.profilePhoto!)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.firstName! + " " + user.lastName!,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    user.city! + "," + user.state!,
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
