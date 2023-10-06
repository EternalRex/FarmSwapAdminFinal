import 'package:flutter/material.dart';

class SignupSuccessPicture extends StatelessWidget {
  const SignupSuccessPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 223,
      height: 210.03,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/clare_assets/images/illustration.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
