import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/reports_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportsLogoutOptionsBtn extends StatelessWidget {
  const ReportsLogoutOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, bottom: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/logout.png'),
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.introPage);
              },
              child: const ReportsText(
                myText: 'Logout',
                myColor: Color(0xFF09041B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}