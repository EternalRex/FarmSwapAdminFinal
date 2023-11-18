import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/listings_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ListingsCommunicationOptionsBtn extends StatelessWidget {
  const ListingsCommunicationOptionsBtn({
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
                Navigator.of(context)
                    .pushNamed(RoutesManager.communicationPage);
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage(
                        'assets/rollaine_assets/icons/communication.png'),
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ListingsText(
                    myText: 'Communication',
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
