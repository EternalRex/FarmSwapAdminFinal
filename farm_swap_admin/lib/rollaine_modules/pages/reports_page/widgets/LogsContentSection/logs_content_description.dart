import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class LogsContentDescription extends StatelessWidget {
  const LogsContentDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 65, right: 45, top: 15),
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
            width: 220,
          ),
          Text(
            'Date',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Text(
            'Time',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          Text(
            'Section',
            style: Poppins.farmerName.copyWith(
              color: const Color.fromARGB(179, 9, 4, 27),
            ),
          ),
        ],
      ),
    );
  }
}
