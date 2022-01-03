import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_task/utils/utils.dart';
import 'package:sample_task/view/widget/custom_button.dart';
import 'package:sample_task/view/widget/custom_textfield.dart';
import 'package:sample_task/viewmodels/address/address_viewmodel.dart';

class UserAddressPage extends StatelessWidget {
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController zipcode = TextEditingController();

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
                CustomTextField(
                    label: '',
                    hint: "Address",
                    inputType: TextInputType.streetAddress,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: address,
                    regExp: '',
                    prefixIcon:
                        const Icon(Icons.home, color: Colors.deepPurpleAccent)),
                CustomTextField(
                    label: '',
                    hint: "Landmark",
                    inputType: TextInputType.streetAddress,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: landmark,
                    regExp: '',
                    prefixIcon:
                        const Icon(Icons.home, color: Colors.deepPurpleAccent)),
                CustomTextField(
                    label: '',
                    hint: "City",
                    inputType: TextInputType.streetAddress,
                    inputAction: TextInputAction.next,
                    obscureText: false,
                    controller: city,
                    regExp: '',
                    prefixIcon:
                        const Icon(Icons.home, color: Colors.deepPurpleAccent)),
                CustomTextField(
                    label: '',
                    hint: "Pin Code",
                    inputType: TextInputType.number,
                    inputAction: TextInputAction.done,
                    obscureText: false,
                    controller: zipcode,
                    regExp: '[0-9]',
                    prefixIcon:
                        const Icon(Icons.home, color: Colors.deepPurpleAccent)),
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
                    value: Provider.of<AddressViewModel>(context,listen: false).cityList[0],
                    onChanged: (newValue) {
                      Provider.of<AddressViewModel>(context,listen: false).selectedState=newValue;
                    },
                    items: Provider.of<AddressViewModel>(context,listen: false).cityList.map((classType) {
                      return DropdownMenuItem(
                          value: classType.toString(),
                          child: Text(classType.toString()));
                    }).toList()),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Submit',
                  borderColor: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  primaryColor: Colors.deepPurpleAccent,
                  radius: 10,
                  onPress: () => _verifyUserAddress(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyUserAddress(BuildContext context) {
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
      Provider.of<AddressViewModel>(context,listen: false).saveUserAddress(
          address.text.trim().toString(),
          landmark.text.trim().toString(),
          zipcode.text.trim().toString(),
          city.text.trim().toString(),
          "Gujarat");
    }
  }
}
