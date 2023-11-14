import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator(
      {super.key,
      required this.color,
      required this.textColor,
      required this.text,
      required this.isSquare,});

  final Color color;
  final Color textColor;
  final String text;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: Poppins.farmerName.copyWith(
                color: textColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
