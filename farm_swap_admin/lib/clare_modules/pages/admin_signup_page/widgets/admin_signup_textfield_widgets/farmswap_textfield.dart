import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';

// ignore: must_be_immutable
class FarmSwapTextField extends StatefulWidget {
  final String hintText;
  final VoidCallback onPress;
  String? inputIcon;
  bool isPassword;
  bool isNumber;

  FarmSwapTextField({
    super.key,
    required this.hintText,
    required this.onPress,
    this.inputIcon,
    this.isPassword = false,
    this.isNumber = false,
  });

  @override
  State<FarmSwapTextField> createState() => _FarmSwapTextFieldState();
}

class _FarmSwapTextFieldState extends State<FarmSwapTextField> {
  bool? viewPassword = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: FarmSwapGreen.lightGreenHover,
        ),
      ),
      //Te sizedbox is used to set the width of the textfield
      child: SizedBox(
        width: 350,
        child: TextField(
          cursorColor: FarmSwapGreen.normalGreen,
          obscureText: viewPassword! ? false : widget.isPassword,
          keyboardType: widget.isNumber == true
              ? TextInputType.number
              : TextInputType.text,
          onChanged: (value) => widget.onPress,
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Color(0xFF3B3B3B),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.50,
              ),
            ),
            prefixIcon: widget.inputIcon != null
                ? Container(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      widget.inputIcon!,
                      height: 20,
                      width: 20,
                    ),
                  )
                : null,
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        viewPassword = !viewPassword!;
                      });
                    },
                    icon: Icon(
                      !viewPassword! ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
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
          ),
        ),
      ),
    );
  }
}
