import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupSuccessButton extends StatelessWidget {
  const SignupSuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 50,
              width: 141,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 5,
                    offset: const Offset(1, 5),
                  ),
                ],
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    //this will be directed to dashboardpage when you hit continue button
                    Navigator.of(context).pushNamed(RoutesManager.dashboard);
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
