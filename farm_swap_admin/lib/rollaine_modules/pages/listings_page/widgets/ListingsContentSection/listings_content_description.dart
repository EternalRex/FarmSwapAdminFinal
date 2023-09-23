import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class ListingsContentDescription extends StatelessWidget {
  const ListingsContentDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Content Title
              Text(
                'List of Farmers Requesting for Promotion:',
                style: Poppins.contentTitle.copyWith(
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
