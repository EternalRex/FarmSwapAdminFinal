import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/listings_text.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/title_text.dart';
import 'package:farm_swap_admin/routes/routes_rollaine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Communication extends StatefulWidget {
  const Communication({super.key});

  @override
  State<Communication> createState() => _Communication();
}

class _Communication extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //First expanded division of a row
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                //Designing the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),

                  //Box shadow of the container
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),

                //Column in which there is the navigation options
                child: Column(
                  children: [
                    //Row for the logo, name, and slogan
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage('assets/images/farmswapLogo.png'),
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
                                      const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 70.0),
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Dashboard icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/dashboard.png'),
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Dashboard',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/admin.png'),
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Admin Account',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/user.png'),
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.userAccountPage);
                              },
                              child: const ListingsText(
                                myText: 'User Account',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/listings.png'),
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.listingsPage);
                              },
                              child: const ListingsText(
                                myText: 'Listings',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/transaction.png'),
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Transactions',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/reports.png'),
                              height: 22,
                              width: 22,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.reportsPage);
                              },
                              child: const ListingsText(
                                myText: 'Reports',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/dispute.png'),
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Dispute',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/wallet.png'),
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Wallet',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image:
                                  AssetImage('assets/icons/communication.png'),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.communicationPage);
                              },
                              child: const ListingsText(
                                myText: 'Communication',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),

                    //Logout icon and label
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 20),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/logout.png'),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const ListingsText(
                                myText: 'Logout',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Second expanded division that contains the content
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  //Design the page title
                  title: const TitleText(
                    myText: 'Communication',
                    myColor: Color(0xFF09041B),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10),

                      //Container for search bar
                      child: SizedBox(
                        width: 250,
                        height: 15,
                        child: TextField(
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFDA6317), height: 1.5),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            fillColor:
                                const Color(0xFFF9A84D).withOpacity(0.10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            prefixIcon: const Icon(Icons.search_rounded),
                            prefixIconColor: const Color(0xFFDA6317),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        //Decorate the expanded area for the main content
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          height: 250,
                          //Design of the container
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),

                            //Box shadow of container
                            boxShadow: [
                              BoxShadow(
                                color: shadow,
                                blurRadius: 2,
                                offset: const Offset(1, 5),
                              ),
                            ],
                          ),

                          child: Column(
                            children: [
                              //Edit button
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 890, top: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon:
                                          Image.asset('assets/icons/edit.png'),
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
                                      width: 660,
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
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Expanded for the sent notification history
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        //Container where the sent notification history is stored
                        child: Container(
                          //Design of the container
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          //Column for the content
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  //Row for the content title
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sent Notification History',
                                        style: Poppins.contentText.copyWith(
                                            color: const Color(0xFF09041B)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(1, 5),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Sent to:',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Karl Eve Mar Modequillo',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'You have been reported as a violator of our community guidelines...',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        DecoratedBox(
                                                          decoration:
                                                              const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                Color(0xEEFF9012),
                                                                Color.fromARGB(
                                                                    255,
                                                                    233,
                                                                    104,
                                                                    39),
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(
                                                                  17.50),
                                                            ),
                                                          ),
                                                          child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              disabledForegroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.38),
                                                              disabledBackgroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.12),
                                                              shadowColor: Colors
                                                                  .transparent,
                                                            ),
                                                            onPressed: () {},
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom: 5),
                                                              child: Text(
                                                                'Details',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      0.50,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                          
                          
                          
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(1, 5),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Sent to:',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Karl Eve Mar Modequillo',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'You have been reported as a violator of our community guidelines...',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        DecoratedBox(
                                                          decoration:
                                                              const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                Color(0xEEFF9012),
                                                                Color.fromARGB(
                                                                    255,
                                                                    233,
                                                                    104,
                                                                    39),
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(
                                                                  17.50),
                                                            ),
                                                          ),
                                                          child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              disabledForegroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.38),
                                                              disabledBackgroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.12),
                                                              shadowColor: Colors
                                                                  .transparent,
                                                            ),
                                                            onPressed: () {},
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom: 5),
                                                              child: Text(
                                                                'Details',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      0.50,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                          
                          
                          
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(1, 5),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Sent to:',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Karl Eve Mar Modequillo',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'You have been reported as a violator of our community guidelines...',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        DecoratedBox(
                                                          decoration:
                                                              const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                Color(0xEEFF9012),
                                                                Color.fromARGB(
                                                                    255,
                                                                    233,
                                                                    104,
                                                                    39),
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(
                                                                  17.50),
                                                            ),
                                                          ),
                                                          child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              disabledForegroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.38),
                                                              disabledBackgroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.12),
                                                              shadowColor: Colors
                                                                  .transparent,
                                                            ),
                                                            onPressed: () {},
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom: 5),
                                                              child: Text(
                                                                'Details',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      0.50,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                          
                          
                          
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(1, 5),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Sent to:',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Karl Eve Mar Modequillo',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          'You have been reported as a violator of our community guidelines...',
                                                          style: Poppins
                                                              .detailsText
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051C),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 50,
                                                        ),
                                                        DecoratedBox(
                                                          decoration:
                                                              const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                Color(0xEEFF9012),
                                                                Color.fromARGB(
                                                                    255,
                                                                    233,
                                                                    104,
                                                                    39),
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(
                                                                  17.50),
                                                            ),
                                                          ),
                                                          child: ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              disabledForegroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.38),
                                                              disabledBackgroundColor:
                                                                  Colors
                                                                      .transparent
                                                                      .withOpacity(
                                                                          0.12),
                                                              shadowColor: Colors
                                                                  .transparent,
                                                            ),
                                                            onPressed: () {},
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom: 5),
                                                              child: Text(
                                                                'Details',
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      0.50,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                          
                          
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
