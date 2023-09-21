import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:flutter/material.dart';

class TransLogo extends StatelessWidget {
  const TransLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 11, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
                "assets/clare_assets/images/logo.png"),
            width: 35,
            height: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              paymentStatusTitle(),
              paymentStatusSubTitle(),
            ],
          ),
        ],
      ),
    );
  }
}
