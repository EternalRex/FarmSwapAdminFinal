import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/Colors/colors.dart';
import '../../../routes/routes.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //USING STACK SINCE WE ARE GOING TO PUT AN ELEMENT ONE ON TOP OF THE OTHER
      body: Stack(
        children: [
          /*THE BACKGROUND IMAGE WHERE WIDTH AND HEIGHT ARE SET TO MATCH
          THE SCREEN SIZE*/
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SvgPicture.asset(
              "karl_assets/images/pattern2.svg",
              fit: BoxFit.fill,
            ),
          ),
          /*THIS IS THE LOGO OF FARMSWAP */
          Center(
            /*THIS COLUMN WILL CONTAIN THE LOGO, THE FARMSWAP NAME
            AND THE DESCRIPTION */
            child: Column(
              //CENTERING EVERY CHILD OF THIS COLUMN
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //THE LOGO PICTURE
                const Image(
                  image: AssetImage(
                    "assets/karl_assets/images/logo3.png",
                  ),
                ),
                //THE FARMSWAP NAME
                Text(
                  "FarmSwap",
                  style: GoogleFonts.viga(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          Color(0xFF53E78B),
                          Color(0xFF14BE77),
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                      ),
                  ),
                ),
                //FARMSWAP DESCRIPTION
                Text(
                  "Modern Barter Solution",
                  style: GoogleFonts.inter(
                    color: const Color(0xFF09051C),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // A BUTTON THAT WHEN CLICKED LEADS TO THE SIGN IN PAGE
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RoutesManager.introPage);
                  },
                  //STYLING THE BACKGROUND OF THE BUTTON
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return farmSwapTitlegreen;
                      } else {
                        return buttonGreen;
                      }
                    }),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
