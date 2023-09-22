import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../routes/routes.dart';
import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class DashAdminAccountOptionsBtn extends StatelessWidget {
  const DashAdminAccountOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/adminAcc.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesManager.adminAccount,
              );
            },
            child: DashBoardTxt(
              myText: "Admin Account",
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
