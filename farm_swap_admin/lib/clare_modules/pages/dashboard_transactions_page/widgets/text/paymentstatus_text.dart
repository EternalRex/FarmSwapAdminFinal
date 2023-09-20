import "package:flutter/material.dart";

Text paymentStatusTitle({String? text, String? fontFamily, Color? color}) {
  return const Text(
    'Password reset successful.',
    style: TextStyle(
      color: Color(0xFF09041B),
      fontSize: 23,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.31,
    ),
  );
}
