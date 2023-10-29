import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class RightUserText extends StatelessWidget {
  const RightUserText({
    super.key,
    required this.myText,
    required this.myColor,
  });

  final String myText;
  final Color myColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: Poppins.rightTitle.copyWith(
        color: myColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
