import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/listings_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ListingsDashboardOptionsBtn extends StatelessWidget {
  const ListingsDashboardOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/dashboard.png'),
              height: 23,
              width: 23,
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.dashboard);
              },
              child: const ListingsText(
                myText: 'Dashboard',
                myColor: Color(0xFF09041B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
