import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SignupHaveAccountFont extends StatelessWidget {
  const SignupHaveAccountFont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Text(
      'Already have an account?',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: const Color(0xFF53E78B),
          fontSize: height * 0.0147,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: const Color(0xFF53E78B),
        ),
      ),
    );
  }
}

Text farmSwapFont(
    {required String text,
    required double size,
    String? fontFamily,
    Color? color}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: 16,
      fontFamily: fontFamily ?? 'Viga',
      fontWeight: FontWeight.w800,
    ),
  );
}

//for admin sign up title farmswap typography
Text farmSwapFontTitle(
    {required String text,
    required double size,
    String? fontFamily,
    Color? color}) {
  return Text(
    text,
    style: GoogleFonts.viga(
      textStyle: TextStyle(
        color: color ?? const Color(0xFF53E78B),
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.50,
        height: 1.20,
      ),
    ),
  );
}

//for admin sign up title farmswap typography
Text farmSwapFontsubtitle(
    {required String text,
    required double size,
    String? fontFamily,
    Color? color}) {
  return Text(
    text,
    style: GoogleFonts.inter(
      textStyle: TextStyle(
        color: color ?? const Color(0xFF09051C),
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        height: 1.20,
      ),
    ),
  );
}

Text signupTermsConditionFont(
    {String? text, double? size, String? fontFamily, Color? color}) {
  return const Text(
    'By signing up, you agree to FarmSwap Terms and Conditions',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.67,
    ),
  );
}
