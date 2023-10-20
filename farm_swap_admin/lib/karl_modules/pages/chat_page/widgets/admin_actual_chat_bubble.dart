import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminChatBubble extends StatelessWidget {
  const AdminChatBubble({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: farmSwapSmoothGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
