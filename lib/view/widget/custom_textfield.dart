import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  bool? obscureText;
  final TextEditingController? controller;
  final String? regExp;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  CustomTextField(
      {this.label,
      this.hint,
      this.inputType,
      this.inputAction,
      this.obscureText=false,
      this.controller,
      this.regExp,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label!='',
          child: Text(
            label!,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          textInputAction: inputAction,
          keyboardType: inputType,
          obscureText: obscureText!,
          inputFormatters: <TextInputFormatter>[
            regExp!=''? FilteringTextInputFormatter.allow(RegExp(regExp!)):FilteringTextInputFormatter.deny('')
          ],
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: 15),
              hintText: hint,
              hintStyle: GoogleFonts.poppins(fontSize: 14, color: Colors.grey)),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
