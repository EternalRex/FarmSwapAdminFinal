import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/user_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class UserListingsOptionsBtn extends StatelessWidget {
  const UserListingsOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/listings.png'),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.listingsPage);
              },
              child: const UserAccountText(
                myText: 'Listings',
                myColor: Color(0xFF09041B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
