import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_editprofile/widgets/Text/editprofile_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class FarmerWalletRequestsListBtn extends StatelessWidget {
  const FarmerWalletRequestsListBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.requestwalletpage);
              },
              child: const EditProfileText(
                myText: 'Farmer',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage('assets/clare_assets/images/Farmer.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}

class ConsumerWalletRequestsListBtn extends StatelessWidget {
  const ConsumerWalletRequestsListBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.walletPage);
              },
              child: const EditProfileText(
                myText: 'Consumer',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage('assets/clare_assets/images/Consumer.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}