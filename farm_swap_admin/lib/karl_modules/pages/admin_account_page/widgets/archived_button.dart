import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/Colors/colors_rollaine.dart';
import '../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

class ArchivedAccountOptionsBtn extends StatelessWidget {
  const ArchivedAccountOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return //this is for archived accounts list buttons
        Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-0.99, 0.15),
          end: Alignment(0.99, -0.15),
          colors: [Color(0xFFFFD07D), Color(0xFFFEAD1D)],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(17.50),
        ),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.archivedaccountlists);
          },
          child: DashBoardTxt(
            myText: "Archived Accounts",
            myColor: Colors.white,
            mySize: 12,
            myFont: GoogleFonts.poppins().fontFamily,
            myWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
