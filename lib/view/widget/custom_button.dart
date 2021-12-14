import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final text;
  final VoidCallback? onPress;
  final Color? primaryColor;
  final Color? borderColor;
  final Color? textColor;
  final double radius;

  CustomButton(
      {this.text,
      this.onPress,
      this.primaryColor,
      this.borderColor,
      this.textColor,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w600, color: textColor),
      ),
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderColor!, width: 1.5),
          elevation: 0,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          primary: primaryColor),
      onPressed: onPress,
    );
  }
}
