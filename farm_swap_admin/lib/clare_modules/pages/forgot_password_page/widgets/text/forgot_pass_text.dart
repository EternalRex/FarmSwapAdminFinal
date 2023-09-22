import "package:flutter/material.dart";

class ForgotPassText extends StatelessWidget {
  const ForgotPassText({
    super.key,
    required this.myText,
  });

  final String myText;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: const TextStyle(
        color: Color(0xFF09041B),
        fontSize: 25,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 1.31,
      ),
    );
  }
}

class ForgotPassTextSms extends StatelessWidget {
  const ForgotPassTextSms({
    super.key,
    required this.myText,
  });

  final String myText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      myText,
      style: TextStyle(
        color: const Color(0xFF09051C),
        fontSize: height * 0.0197,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
    );
  }
}

class ForgotPassTextEmail extends StatelessWidget {
  const ForgotPassTextEmail({
    super.key,
    required this.myText,
  });

  final String myText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Text(
      myText,
      style: TextStyle(
        color: const Color(0xFF09051C),
        fontSize: height * 0.0197,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w400,
        height: 1.50,
      ),
    );
  }
}

Text resetPassTitle({required String text, String? fontFamily, Color? color}) {
  return Text(
    text,
    style: const TextStyle(
      color: Color(0xFF09041B),
      fontSize: 25,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.31,
    ),
  );
}

class resetPassSubTitle extends StatelessWidget {
  const resetPassSubTitle({
    super.key,
    required this.myText,
  });

  final String myText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return const Text(
      'Enter your new password here.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 1.81,
      ),
    );
  }
}

Text resetPassSuccessTitle({String? text, String? fontFamily, Color? color}) {
  return const Text(
    'Congrats!',
    style: TextStyle(
      color: Color(0xFF53E78B),
      fontSize: 30,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.31,
    ),
  );
}

Text resetPassSuccessSubTitle(
    {String? text, String? fontFamily, Color? color}) {
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
