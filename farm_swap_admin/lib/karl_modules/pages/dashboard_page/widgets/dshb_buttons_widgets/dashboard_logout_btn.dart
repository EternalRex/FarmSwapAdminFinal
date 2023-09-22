import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../routes/routes.dart';
import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashLogoutOptionBtn extends StatelessWidget {
  const DashLogoutOptionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                "assets/karl_assets/images/logout.png",
              ),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              height: 3,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.introPage);
              },
              child: DashBoardTxt(
                myText: "Logout",
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
