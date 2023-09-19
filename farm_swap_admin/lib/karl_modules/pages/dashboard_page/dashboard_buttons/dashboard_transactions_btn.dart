import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard_widgets.dart/widget_dashboard_txt.dart';

class DashTransactionsOptionsBtn extends StatelessWidget {
  const DashTransactionsOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/transactions.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(RoutesManager.adminTransactionsPayment);
            },
            child: DashBoardTxt(
              myText: "Transactions",
              myColor: Colors.black,
              mySize: 13,
              myFont: GoogleFonts.poppins().fontFamily,
              myWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
