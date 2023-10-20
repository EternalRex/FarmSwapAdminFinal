/*This class is just a design of a text used in the right sidebar*/

import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSideBarOptions extends StatelessWidget {
  const ChatSideBarOptions({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*The icon */
          Image.asset(
            image,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 10,
            height: 10,
          ),
          /*The text that describes the icon */
          Text(
            text,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
