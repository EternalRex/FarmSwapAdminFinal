import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/Text/commu_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class CommuDisputeOptionsBtn extends StatelessWidget {
  const CommuDisputeOptionsBtn({
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
                Navigator.of(context).pushNamed(RoutesManager.dispute);
              },
              child: const Row(
                children: [
                  Image(
                    image:
                        AssetImage('assets/rollaine_assets/icons/dispute.png'),
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CommunicationText(
                    myText: 'Dispute',
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
