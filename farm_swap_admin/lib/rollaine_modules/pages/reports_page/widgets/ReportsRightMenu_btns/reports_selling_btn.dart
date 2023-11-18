import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/right_reports_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportsSellingOptionsBtn extends StatelessWidget {
  const ReportsSellingOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.sellingPage);
              },
              child: const Row(
                children: [
                  RightReportsText(
                    myText: 'Selling Transactions',
                    myColor: Color(0xFF09041B),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image:
                        AssetImage('assets/rollaine_assets/icons/selling.png'),
                    height: 22,
                    width: 22,
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
