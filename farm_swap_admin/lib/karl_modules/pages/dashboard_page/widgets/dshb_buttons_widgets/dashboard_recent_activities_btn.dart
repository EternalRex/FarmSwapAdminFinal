import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

class AdminRecentActivitiesBtn extends StatefulWidget {
  const AdminRecentActivitiesBtn({super.key});

  @override
  State<AdminRecentActivitiesBtn> createState() =>
      _AdminRecentActivitiesBtnState();
}

class _AdminRecentActivitiesBtnState extends State<AdminRecentActivitiesBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xEEFF9012),
            Color.fromARGB(255, 233, 104, 39),
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
          onPressed: () {},
          child: DashBoardTxt(
            myText: "Activities",
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
