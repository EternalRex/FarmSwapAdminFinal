import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class EditProfileTitle extends StatelessWidget {
  const EditProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Content Title
          Text(
            'Edit Profile',
            style: Poppins.contentTitle.copyWith(
              color: const Color(0xFF09041B),
            ),
          ),
        ],
      ),
    );
  }
}
