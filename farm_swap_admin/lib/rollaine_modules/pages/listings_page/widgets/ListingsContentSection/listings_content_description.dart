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

        //Name
        Padding(
          padding: const EdgeInsets.only(left: 45, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: Poppins.farmerName.copyWith(
                  color: const Color.fromARGB(179, 9, 4, 27),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
