import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/routes.dart';
import '../dashboard_widgets.dart/widget_dashboard_txt.dart';

class DashLogoutOptionBtn extends StatelessWidget {
  const DashLogoutOptionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 40,
          ),
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/logout.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesManager.introPage);
            },
            child: DashBoardTxt(
              myText: "Logout",
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
