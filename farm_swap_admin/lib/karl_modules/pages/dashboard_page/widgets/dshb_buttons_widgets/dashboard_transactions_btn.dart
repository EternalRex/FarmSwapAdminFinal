import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashTransactionsOptionsBtn extends StatelessWidget {
  const DashTransactionsOptionsBtn({super.key});

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
                Navigator.of(context).pushNamed(RoutesManager.adminTransactionsPromotion);
              },
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/karl_assets/images/transactions.png",
                    ),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DashBoardTxt(
                    myText: "Transactions",
                    myColor: const Color(0xFF09041B),
                    mySize: 13,
                    myFont: GoogleFonts.poppins().fontFamily,
                    myWeight: FontWeight.w500,
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
