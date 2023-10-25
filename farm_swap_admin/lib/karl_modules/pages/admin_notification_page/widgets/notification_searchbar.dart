/*This class is the design of the search bar and this will also hold the search functionality */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSearchBar extends StatelessWidget {
  const NotificationSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(color: const Color(0xFFDA6317), height: 1.5),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(7),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        //prefixIcon: const Icon(Icons.search_rounded),
        //prefixIconColor: const Color(0xFFDA6317),
      ),
    );
  }
}
