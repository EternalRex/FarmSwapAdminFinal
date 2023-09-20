import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FarmSwapContactCard extends StatelessWidget {
  FarmSwapContactCard({
    super.key,
    required this.width,
    required this.height,
    required this.iconPath,
    required this.title,
    required this.content,
    this.onPressed,
  });

  final double width;
  final double height;
  final String iconPath;
  final String title;
  final Widget content;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width * 0.925,
        height: height * 0.129,
        padding: const EdgeInsets.all(25),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x115A6CEA),
              blurRadius: 50,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: const Color(0xFF828282),
                      fontSize: height * 0.0197,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.005),
                content,
              ],
            )
          ],
        ),
      ),
    );
  }
}
