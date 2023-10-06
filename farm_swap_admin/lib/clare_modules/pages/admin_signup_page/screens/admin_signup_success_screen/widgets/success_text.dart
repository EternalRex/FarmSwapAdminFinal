import 'package:flutter/material.dart';

class SignupSuccessText extends StatelessWidget {
  const SignupSuccessText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Congrats!',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF53E78B),
        fontSize: 30,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 1.31,
      ),
    );
  }
}

class SignupSuccessText1 extends StatelessWidget {
  const SignupSuccessText1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your Profile Is Ready To Use',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF09041B),
        fontSize: 23,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 1.31,
      ),
    );
  }
}
