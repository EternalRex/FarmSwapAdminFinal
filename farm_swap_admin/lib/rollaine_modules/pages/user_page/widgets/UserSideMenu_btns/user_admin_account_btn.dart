import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/user_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class UserAdminAccountOptionsBtn extends StatelessWidget {
  const UserAdminAccountOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/admin.png'),
              height: 22,
              width: 22,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.adminAccount);
              },
              child: const UserAccountText(
                myText: 'Admin Account',
                myColor: Color(0xFF09041B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
