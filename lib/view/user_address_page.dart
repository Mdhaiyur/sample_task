import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/controller/user_controller.dart';
import 'package:sample_task/utils/utils.dart';

class UserAddressPage extends GetWidget<UserController> {
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  var cityList=[ 'Maharashtra','Gujarat','Karnataka','Madhya Pradesh','Delhi','Others'];


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
          "Your Address",
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: address,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.home,
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
                      hintText: "Address",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: landmark,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.home,
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
                      hintText: "Landmark",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: city,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.home,
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
                      hintText: "City",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  controller: zipcode,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.home,
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
                      hintText: "Pin Code",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 15,
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
                    value: cityList[0],
                    onChanged: (newValue) {

                    },
                    items: cityList.map((classType) {
                      return DropdownMenuItem(
                          value: classType.toString(),
                          child: Text(classType.toString()));
                    }).toList()),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(
                    'Submit',
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
                    _verifyUserAddress();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyUserAddress() {
    if (address.text.trim().toString().isEmpty) {
      Utils().showSnackbar("Address must be entered");
    } else if (address.text.trim().toString().length < 4) {
      Utils().showSnackbar("Address must Contain Atleast 4 Characters.");
    } else if (landmark.text.trim().toString().isEmpty) {
      Utils().showSnackbar("Landmark must be entered");
    } else if (landmark.text.trim().toString().length < 4) {
      Utils().showSnackbar("Landmark must Contain Atleast 4 Characters.");
    } else if (zipcode.text.trim().toString().isEmpty) {
      Utils().showSnackbar("Zipcode must be entered");
    } else if (zipcode.text.trim().toString().length != 6) {
      Utils().showSnackbar("Zipcode must Contain 6 Characters.");
    } else {
      controller.saveUserAddress(
          address.text.trim().toString(),
          landmark.text.trim().toString(),
          zipcode.text.trim().toString(),
          city.text.trim().toString(),
          "Gujarat");
    }
  }
}
