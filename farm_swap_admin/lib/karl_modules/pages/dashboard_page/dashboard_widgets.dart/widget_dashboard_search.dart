import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "widget_dashboard_colors.dart";

class DashBSearchBar extends StatelessWidget {
  const DashBSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: dashbiardStrongOrangeColor,
        ),
        labelText: "Search",
        labelStyle: TextStyle(
          color: dashboardOrangeColor,
          fontSize: 13,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }
}
