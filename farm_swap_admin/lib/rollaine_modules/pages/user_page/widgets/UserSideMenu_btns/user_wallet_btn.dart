import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/user_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class UserWalletOptionsBtn extends StatelessWidget {
  const UserWalletOptionsBtn({super.key});

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
                    .pushNamed(RoutesManager.requestwalletpage);
              },
              child: const Row(
                children: [
                  Image(
                    image:
                        AssetImage('assets/rollaine_assets/icons/wallet.png'),
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  UserAccountText(
                    myText: 'Wallet',
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
