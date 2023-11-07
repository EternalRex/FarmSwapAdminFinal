import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashWalletOptions extends StatelessWidget {
  const DashWalletOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                "assets/karl_assets/images/wallet.png",
              ),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              height: 3,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.farmerrequestwalletpage);
              },
              child: DashBoardTxt(
                myText: "Wallet",
                myColor: const Color(0xFF09041B),
                mySize: 13,
                myFont: GoogleFonts.poppins().fontFamily,
                myWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
