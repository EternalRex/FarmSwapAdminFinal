import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class UserContentDescriptions extends StatelessWidget {
  const UserContentDescriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Name',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
          const SizedBox(
            width: 305,
          ),
          Text(
            'Status',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
          const SizedBox(
            width: 230,
          ),
          Text(
            'Sends',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
        ],
      ),
    );
  }
}
