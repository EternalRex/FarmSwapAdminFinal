import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLogoSideMenu extends StatelessWidget {
  const UserLogoSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('assets/rollaine_assets/images/farmswapLogo.png'),
            height: 50,
            width: 50,
          ),

          //Column for FarmSwap title and slogan
          Column(
            children: [
              //FarmSwap title
              Text(
                'FarmSwap',
                style: GoogleFonts.viga(
                  fontSize: 30,
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

              //FarmSwap slogan
              Text(
                'Modern Barter Solution',
                style: GoogleFonts.inter(
                  color: const Color(0xFF09051C),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
