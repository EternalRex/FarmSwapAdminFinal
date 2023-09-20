import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../routes/routes.dart';
import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashAdminAccountOptionsBtn extends StatelessWidget {
  const DashAdminAccountOptionsBtn({super.key});

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
                "assets/karl_assets/images/adminAcc.png",
              ),
              height: 20,
              width: 20,
            ),
            const SizedBox(
                width: 3,
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RoutesManager.adminAccount,
                );
              },
              child: DashBoardTxt(
                myText: "Admin Account",
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
