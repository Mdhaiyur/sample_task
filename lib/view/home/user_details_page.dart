import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/model/user_model.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage(this.user);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          color: Colors.transparent,
          child: Container(
            width: Get.width,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(15.0),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close)),
                ),
                Text(
                  "Basic Info",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          child: user.profilePhoto == null
                              ? Image.asset(
                                  'assets/images/user_placeholder.png')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Image.memory(user.profilePhoto!)),
                        ),
                        Text(
                          user.email!,
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.mobileNumber!,
                          style: GoogleFonts.poppins(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.firstName! + " " + user.lastName!,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.designation!,
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.blue),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.address!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.locality!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.city! + "," + user.state!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          user.zipcode!,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Education Info",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.education!,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 3),
                Text(
                  'Passing year - ${user.yearOfPassing!}',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 3),
                Text(
                  user.grade!,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 30),
                Text(
                  "Professional Info",
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.yearOfExperience!} Year of Expenrience',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 3),
                Text(
                  user.domain!,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          )),
    );
  }
}
