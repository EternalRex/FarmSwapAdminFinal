import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DashCommunicationOptionsBtn extends StatelessWidget {
  const DashCommunicationOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(
              "assets/karl_assets/images/communications.png",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                RoutesManager.communicationPage,
              );
            },
            child: DashBoardTxt(
              myText: "Communication",
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
