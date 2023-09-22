import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class LogsContentTitle extends StatelessWidget {
  const LogsContentTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 65, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Content Title
          Text(
            'Admin Logs',
            style: Poppins.contentTitle.copyWith(
              color: const Color(0xFF09041B),
            ),
          ),
        ],
      ),
    );
  }
}