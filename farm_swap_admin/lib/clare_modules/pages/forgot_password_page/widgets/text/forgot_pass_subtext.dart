import "package:flutter/material.dart";

class ForgotPassSubText extends StatelessWidget {
  const ForgotPassSubText({
    super.key,
    required this.myText,
  });

  final String myText;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 1.81,
      ),
    );
  }
}
