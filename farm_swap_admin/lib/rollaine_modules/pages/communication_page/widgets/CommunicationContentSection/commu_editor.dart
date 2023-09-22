import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommuEditor extends StatelessWidget {
  const CommuEditor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Edit button
        Padding(
          padding:
              const EdgeInsets.only(left: 930, top: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon:
                    Image.asset('assets/rollaine_assets/icons/edit.png'),
                iconSize: 23,
              ),
            ],
          ),
        ),

        //Message
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(
                child: Text(
                  'You have been reported as a violator of our community guidelines.\nWe hereby inform you that we are going to suspend your account.',
                  style: Poppins.commuText.copyWith(
                    color: const Color(0xFF09051C),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        //Buttons
        Padding(
          padding: const EdgeInsets.only(
              left: 30, right: 30, top: 55),
          child: Row(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xEEFF9012),
                      Color(0xFFE21B1B),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.50),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor: Colors
                        .transparent
                        .withOpacity(0.38),
                    disabledBackgroundColor: Colors
                        .transparent
                        .withOpacity(0.12),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 710,
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF53E78B),
                      Color(0xFF14BE77),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.50),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor: Colors
                        .transparent
                        .withOpacity(0.38),
                    disabledBackgroundColor: Colors
                        .transparent
                        .withOpacity(0.12),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5),
                    child: Text(
                      '   SMS   ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF53E78B),
                      Color(0xFF14BE77),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.50),
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    disabledForegroundColor: Colors
                        .transparent
                        .withOpacity(0.38),
                    disabledBackgroundColor: Colors
                        .transparent
                        .withOpacity(0.12),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5),
                    child: Text(
                      '  PUSH  ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}