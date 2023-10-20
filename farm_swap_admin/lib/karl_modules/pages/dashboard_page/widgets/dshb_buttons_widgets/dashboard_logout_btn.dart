import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/functions/update_online_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../routes/routes.dart';
import '../../../admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import '../dshb_textfield_widgets/widget_dashboard_txt.dart';

// ignore: must_be_immutable
class DashLogoutOptionBtn extends StatelessWidget {
  DashLogoutOptionBtn({super.key});

  final UpdateOnlineStatus onlineStatus = UpdateOnlineStatus();
  final bool active = false;

  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

  final email = FirebaseAuth.instance.currentUser!.email;

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
                /*So mag kuha ni siya sa admin logs nya iyang description kay ni login */
                /*adminLogs.createAdminLogs(
                    email,
                    FirebaseAuth.instance.currentUser!.uid,
                    "Account_LogOut",
                    DateTime.now());
                    */
                /*Changes the login status of the user into false */
                onlineStatus.updateOnlineStatus(
                    FirebaseAuth.instance.currentUser!.uid, active);
                Navigator.of(context).pushNamed(RoutesManager.signInPage);
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
