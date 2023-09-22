import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FarmSwapSocialButton extends StatelessWidget {
  final String logoPath;
  final String buttonTitle;
  const FarmSwapSocialButton({
    super.key,
    required this.logoPath,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 0.50, color: Color.fromARGB(255, 197, 196, 196)),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x115A6CEA),
                blurRadius: 50,
                offset: Offset(12, 26),
                spreadRadius: 0,
              )
            ],
          ),
          child: SvgPicture.asset(
            logoPath,
            width: 25,
            height: 25,
          ),
        ),
        const SizedBox(width: 13),
        Text(
          buttonTitle,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Color(0xFF09051C),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.50,
            ),
          ),
        ),
      ],
    );
  }
}
