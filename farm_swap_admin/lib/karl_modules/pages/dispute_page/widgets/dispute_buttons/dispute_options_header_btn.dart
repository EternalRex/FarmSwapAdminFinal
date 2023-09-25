import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisputePageOptionsTitle extends StatefulWidget {
  const DisputePageOptionsTitle({super.key});

  @override
  State<DisputePageOptionsTitle> createState() => _DisputePageOptionsTitleState();
}

class _DisputePageOptionsTitleState extends State<DisputePageOptionsTitle> {
  @override
  Widget build(BuildContext context) {
    /*A ROW THAT HOLDS THE LOGO , THE FARMSWAP TITLE AND THE DESCRIPTION */
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage("assets/karl_assets/images/logo3.png"),
            width: 55,
            height: 50,
          ),
          /*A COLUMN THAT IS PART OF THE ROW CHILDREN, HOLDS THE TITLE
            AND THE DESCRIPTION, THIS IS DONE SO THAT I CAN PUT THE DESCRIPTION
            UNDER THE TITLE BECAUSE IF I ONLY USE THE ROW, IT WILL DISPLAY THE 
            DESCRIPTION NEXT TO THE TITLE AND NOT BELOW IT */
          Column(
            children: [
              /*THE FARMSWAP TITLE */
              Text(
                "FarmSwap",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: GoogleFonts.viga().fontFamily,
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
              /*THE FARMSWAP DESCRIPTION */
              Text(
                "Modern Barter Solution",
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: const Color(0xFF09051C),
                  fontSize: 8,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
