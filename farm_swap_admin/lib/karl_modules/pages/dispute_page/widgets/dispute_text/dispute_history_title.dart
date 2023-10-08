import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class DisputeHistoryTitle extends StatelessWidget {
  const DisputeHistoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 65, top: 25),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              //Content Title
              Text(
                'Dispute History',
                style:
                    Poppins.contentTitle.copyWith(
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