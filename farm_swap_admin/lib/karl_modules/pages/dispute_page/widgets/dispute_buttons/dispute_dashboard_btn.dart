import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../routes/routes.dart';
import '../dispute_text/widget_dispute_txt.dart';

class DisputeDashboardOptionsBtn extends StatelessWidget {
  const DisputeDashboardOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage(
                "assets/karl_assets/images/dashboard.png",
              ),
              height: 20,
              width: 20,
            ),
            const SizedBox(
                width: 3,
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.dashboard);
              },
              child: DisputeTxt(
                myText: "Dashboard",
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
