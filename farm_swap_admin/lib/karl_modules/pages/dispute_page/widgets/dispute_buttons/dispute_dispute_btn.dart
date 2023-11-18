import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../dispute_text/widget_dispute_txt.dart';

class DisputeDisputeOptionsBtn extends StatelessWidget {
  const DisputeDisputeOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.dispute);
              },
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/karl_assets/images/dispute.png",
                    ),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DisputeTxt(
                    myText: "Dispute",
                    myColor: const Color(0xFF09041B),
                    mySize: 13,
                    myFont: GoogleFonts.poppins().fontFamily,
                    myWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
