import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/listings_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ListingsAdminAccountOptionsBtn extends StatelessWidget {
  const ListingsAdminAccountOptionsBtn({super.key});

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
                  ListingsText(
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
