import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/reports_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportsCommunicationOptionsBtn extends StatelessWidget {
  const ReportsCommunicationOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image:
                  AssetImage('assets/rollaine_assets/icons/communication.png'),
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.communicationPage);
              },
              child: const ReportsText(
                myText: 'Communication',
                myColor: Color(0xFF09041B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}