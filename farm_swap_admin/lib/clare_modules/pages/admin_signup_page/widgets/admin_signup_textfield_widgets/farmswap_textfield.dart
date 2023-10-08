import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../constants/Colors/farmswap_colors.dart';

// ignore: must_be_immutable
class FarmSwapTextField extends StatelessWidget {
  FarmSwapTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.isPassword,
    this.prefixIcon,
    this.suffixIcon,
  });

  TextEditingController controller;
  Widget label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: FarmSwapGreen.lightGreenHover,
        ),
      ),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          cursorColor: FarmSwapGreen.normalGreen,
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            filled: true,
            fillColor: Colors.white,
            label: label,
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFF3B3B3B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.50,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 0.50, color: Color.fromARGB(255, 50, 202, 108)),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.50, color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.50, color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}