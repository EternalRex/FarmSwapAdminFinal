import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/right_reports_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportsRevenueOptionsBtn extends StatelessWidget {
  const ReportsRevenueOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.revenuereport);
              },
              child: const RightReportsText(
                myText: 'Revenue Reports',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/platform.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}
