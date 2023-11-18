import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/right_reports_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportsPlatformOptionsBtn extends StatelessWidget {
  const ReportsPlatformOptionsBtn({
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
                Navigator.of(context).pushNamed(RoutesManager.platformPage);
              },
              child: const Row(
                children: [
                  RightReportsText(
                    myText: 'Platform Reports',
                    myColor: Color(0xFF09041B),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image:
                        AssetImage('assets/rollaine_assets/icons/platform.png'),
                    height: 23,
                    width: 23,
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
