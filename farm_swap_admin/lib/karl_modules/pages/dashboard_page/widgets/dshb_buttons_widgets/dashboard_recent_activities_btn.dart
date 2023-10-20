import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../admin_account_page/screens/admin_account_logs/provider/adminlogs_provider.dart';
import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

// ignore: must_be_immutable
class AdminRecentActivitiesBtn extends StatefulWidget {
  AdminRecentActivitiesBtn({super.key});

  String selectedId = "";

  @override
  State<AdminRecentActivitiesBtn> createState() =>
      _AdminRecentActivitiesBtnState();
}

class _AdminRecentActivitiesBtnState extends State<AdminRecentActivitiesBtn> {
  @override
  Widget build(BuildContext context) {
    //this uid will be used to activities button
    final userID = FirebaseAuth.instance.currentUser!.uid;
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
          onPressed: () {
            setState(() {
              widget.selectedId = userID;
            });
            //assign the widget.selectedId to setAdminUserId
            //to bring in other class
            Provider.of<AdminActivityProvider>(context, listen: false)
                .setadminUserId(widget.selectedId);
            //this will navigate to admin details.dart
            Navigator.of(context).pushNamed(RoutesManager.adminactivityspage);
            //Navigator.of(context).pushNamed(RoutesManager.adminactivityspage);
          },
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
