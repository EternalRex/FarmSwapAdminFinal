import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListingsDetailsCard extends StatelessWidget {
  const ListingsDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 14, vertical: 14),
      child: Center(
        child: Card(
          //Design the card
          child: SizedBox(
            height: 225,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  //Card details title
                  Text(
                    'Promotion Details',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      height: 1.31,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  //Name of farmer
                  Text(
                    'Vaugh Noe Cabusao',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      height: 1.31,
                    ),
                  ),

                  //Identity
                  Text(
                    'Farmer',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      height: 1.31,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Type of product
                  Text(
                    'Product: Onion',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 9.5,
                      fontWeight: FontWeight.w500,
                      height: 1.31,
                    ),
                  ),

                  //Number of days
                  Text(
                    'Promotion Range: 3 days',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      height: 1.31,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Amount
                  Text(
                    'Payment: 50 scs',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      height: 1.31,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //These are the 2 buttons in the card
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 3, vertical: 3),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
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
                              backgroundColor:
                                  Colors.transparent,
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
                                'Accept',
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
                          height: 5,
                        ),

                        //Reject button
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
                              backgroundColor:
                                  Colors.transparent,
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
                                'Reject',
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
          ),
        ),
      ),
    );
  }
}