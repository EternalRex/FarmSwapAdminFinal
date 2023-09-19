import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class CommuContentDescription extends StatelessWidget {
  const CommuContentDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 20),
      //Row for the content title
      child: Row(
        children: [
          Text(
            'Sent Notification History',
            style: Poppins.contentText.copyWith(
                color: const Color(0xFF09041B)),
          ),
        ],
      ),
    );
  }
}