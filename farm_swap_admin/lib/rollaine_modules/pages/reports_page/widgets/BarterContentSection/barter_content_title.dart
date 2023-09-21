import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class BarterContentTitle extends StatelessWidget {
  const BarterContentTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Content Title
              Text(
                'Barter Transactions Record',
                style: Poppins.contentTitle.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Barter:',
                style: Poppins.contentText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '5',
                style: Poppins.contentText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
