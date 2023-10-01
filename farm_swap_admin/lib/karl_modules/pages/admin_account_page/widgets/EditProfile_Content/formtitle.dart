import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 50, top: 20),
      child: Row(
        children: [
          Text(
            'My Profile',
            style: Poppins.contentTitle.copyWith(
              color: const Color(0xFF09041B),
            ),
          ),
        ],
      ),
    );
  }
}