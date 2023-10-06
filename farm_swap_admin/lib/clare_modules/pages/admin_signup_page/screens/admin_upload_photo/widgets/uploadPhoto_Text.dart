import 'package:flutter/material.dart';

class UploadPhotoText extends StatelessWidget {
  const UploadPhotoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Upload Your Photo Profile',
      style: TextStyle(
        color: Color(0xFF09041B),
        fontSize: 25,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 1.31,
      ),
    );
  }
}

class UploadPhotoText1 extends StatelessWidget {
  const UploadPhotoText1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'This data will be displayed in your account profile.',
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
