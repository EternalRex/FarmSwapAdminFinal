import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard_widgets.dart/widget_dashboard_txt.dart';

class DashReportsOptionsBtn extends StatelessWidget {
  const DashReportsOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/reports.png",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: DashBoardTxt(
              myText: "Reports",
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
