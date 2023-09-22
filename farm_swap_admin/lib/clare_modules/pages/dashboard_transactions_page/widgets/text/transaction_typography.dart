import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Text paymentStatusTitle({String? text, String? fontFamily, Color? color}) {
  return Text(
    'FarmSwap',
    style: GoogleFonts.viga(
      fontSize: 22,
      letterSpacing: 0.50,
      foreground: Paint()
        ..shader = const LinearGradient(
          colors: <Color>[
            Color(0xFF53E78B),
            Color(0xFF14BE77),
          ],
        ).createShader(
          const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
        ),
    ),
  );
}

Text paymentStatusSubTitle({String? text, String? fontFamily, Color? color}) {
  return Text(
    'Modern Barter Solution',
    style: GoogleFonts.inter(
      color: const Color(0xFF09051C),
      fontSize: 8,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.0,
    ),
  );
}

Text sidemenuText({required String text, String? fontFamily, Color? color}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xFF09041B),
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
  );
}

Text transactionTitle(
    {String? text, String? fontSize, String? fontFamily, Color? color}) {
  return const Text(
    "Transactions",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color(0xFF09041B),
      fontSize: 40,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w800,
    ),
  );
}

Text paymentsText({required String text, String? fontFamily, Color? color}) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF09041B),
      fontSize: 20,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.31,
    ),
  );
}

Text rightsidemenuText(
    {required String text, String? fontFamily, Color? color}) {
  return Text(
    text,
    textAlign: TextAlign.right,
    style: const TextStyle(
      color: Color(0xFF09041B),
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.31,
    ),
  );
}

Text containerText({required String text, String? fontFamily, Color? color}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: const TextStyle(
      color: Color(0xFF09041B),
      fontSize: 18,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      height: 1.31,
    ),
  );
}
