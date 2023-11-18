import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/listings_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ListingsTransactionsOptionsBtn extends StatelessWidget {
  const ListingsTransactionsOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.adminTransactionsPromotion);
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage(
                        'assets/rollaine_assets/icons/transaction.png'),
                    height: 22,
                    width: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ListingsText(
                    myText: 'Transactions',
                    myColor: Color(0xFF09041B),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
