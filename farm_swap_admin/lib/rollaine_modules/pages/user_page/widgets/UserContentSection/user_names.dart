import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserNames extends StatelessWidget {
  const UserNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/vaugh.png'),
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Vaugh Noe Cabusao',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 113),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),

              //Details button
              Padding(
                padding: const EdgeInsets.only(left: 133),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Accept button
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
                          disabledForegroundColor:
                              Colors.transparent.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.transparent.withOpacity(0.12),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            'Details',
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/niyumi.png'),
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Niyumi Misty Mitsugi',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),

              //Details button
              Padding(
                padding: const EdgeInsets.only(left: 136),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Accept button
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
                          disabledForegroundColor:
                              Colors.transparent.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.transparent.withOpacity(0.12),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            'Details',
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/jade.png'),
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 113),
                    child: Text(
                      'Jade Cabusao',
                      style: Poppins.userName.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 178),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),

              //Details button
              Padding(
                padding: const EdgeInsets.only(left: 68),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Accept button
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
                          disabledForegroundColor:
                              Colors.transparent.withOpacity(0.38),
                          disabledBackgroundColor:
                              Colors.transparent.withOpacity(0.12),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            'Details',
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
          ),
        ),
      ],
    );
  }
}
