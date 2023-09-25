import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class EditProfileDescription extends StatelessWidget {
  const EditProfileDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(
                  left: 20, top: 20),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Personal Information',
                    style: Poppins
                        .contentTitle
                        .copyWith(
                      color: const Color(
                          0xFF09041B),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  width: 385),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                    Icons.edit_square),
                color: greenNormal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
