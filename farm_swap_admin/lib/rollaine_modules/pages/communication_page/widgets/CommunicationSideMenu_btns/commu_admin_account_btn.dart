import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/Text/commu_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class CommuAdminAccountOptionsBtn extends StatelessWidget {
  const CommuAdminAccountOptionsBtn({
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
                Navigator.of(context).pushNamed(RoutesManager.adminAccount);
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage('assets/rollaine_assets/icons/admin.png'),
                    height: 22,
                    width: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CommunicationText(
                    myText: 'Admin Account',
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
