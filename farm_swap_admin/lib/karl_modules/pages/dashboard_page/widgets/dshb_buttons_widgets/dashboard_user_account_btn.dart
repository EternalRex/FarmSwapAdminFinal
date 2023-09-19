import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashUserAccountOptionsBtn extends StatelessWidget {
  const DashUserAccountOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/userAccounts.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesManager.userAccountPage,
              );
            },
            child: DashBoardTxt(
              myText: "User Account",
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
