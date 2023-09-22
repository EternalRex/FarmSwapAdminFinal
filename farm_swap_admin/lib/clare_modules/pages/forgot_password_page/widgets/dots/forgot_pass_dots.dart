import 'package:flutter/material.dart';

class ForgotPassDots extends StatelessWidget {
  const ForgotPassDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const ShapeDecoration(
        color: Color(0xFF09051C),
        shape: OvalBorder(),
      ),
    );
  }
}
