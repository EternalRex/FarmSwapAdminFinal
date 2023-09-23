import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class AdminEditProfileBtn extends StatefulWidget {
  const AdminEditProfileBtn({super.key});

  @override
  State<AdminEditProfileBtn> createState() => _AdminEditProfileBtnState();
}

class _AdminEditProfileBtnState extends State<AdminEditProfileBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF53E78B),
            Color(0xFF14BE77),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
            Navigator.of(context)
                    .pushNamed(RoutesManager.adminProfile);
          },
          child: DashBoardTxt(
            myText: "Edit Profile",
            myColor: Colors.white,
            mySize: 15,
            myFont: GoogleFonts.poppins().fontFamily,
            myWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
