import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/routes.dart';
import '../dashboard_widgets.dart/widget_dashboard_txt.dart';

class DashBoardOptionsBtn extends StatelessWidget {
  const DashBoardOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/dashboard.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutesManager.dashboard);
            },
            child: DashBoardTxt(
              myText: "Dashboard",
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
