import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SignupHaveAccountFont extends StatelessWidget {
  const SignupHaveAccountFont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Already have an account?',
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          color: Color(0xFF53E78B),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: Color(0xFF53E78B),
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
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: <Color>[
              Color(0xFF53E78B),
              Color(0xFF14BE77),
            ],
          ).createShader(
            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
          ),
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
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      ),
    ),
  );
}

Text signupTermsConditionFont(
    {String? text, double? size, String? fontFamily, Color? color}) {
  return const Text(
    'By signing up, you agree to FarmSwap Terms and \n Conditions',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFF09041B),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.67,
    ),
  );
}
