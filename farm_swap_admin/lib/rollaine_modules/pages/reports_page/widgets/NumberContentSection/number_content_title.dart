import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class NumberContentTitle extends StatelessWidget {
  const NumberContentTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 45, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Content Title
          Text(
            'Number of Users',
            style: Poppins.contentTitle.copyWith(
              color: const Color(0xFF09041B),
            ),
          ),
        ],
      ),
    );
  }
}