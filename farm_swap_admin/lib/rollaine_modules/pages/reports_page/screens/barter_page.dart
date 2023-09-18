import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/reports_text.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/title_text.dart';
import 'package:farm_swap_admin/routes/routes_rollaine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Barter extends StatefulWidget {
  const Barter({super.key});

  @override
  State<Barter> createState() => _Barter();
}

class _Barter extends State<Barter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creating a row consist of 3 expanded divisions
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
                              child: const ReportsText(
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
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  //Design the page title
                  title: const TitleText(
                    myText: 'Reports',
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
                body: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                          //Design of the container
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
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

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Content Title
                                      Text(
                                        'Barter Transactions Record',
                                        style: Poppins.contentTitle.copyWith(
                                          color: const Color(0xFF09041B),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 45, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Barter:',
                                            style: Poppins.contentText.copyWith(
                                              color: const Color(0xFF09041B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 45, top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '5',
                                            style: Poppins.contentText.copyWith(
                                              color: const Color(0xFF09041B),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          
                                //Header
                                //Name
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 45, right: 45, top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: Poppins.farmerName.copyWith(
                                          color: const Color.fromARGB(
                                              179, 9, 4, 27),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 250,
                                      ),
                                      Text(
                                        'Date',
                                        style: Poppins.farmerName.copyWith(
                                          color: const Color.fromARGB(
                                              179, 9, 4, 27),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 150,
                                      ),
                                      Text(
                                        'Barter/s',
                                        style: Poppins.farmerName.copyWith(
                                          color: const Color.fromARGB(
                                              179, 9, 4, 27),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/vaugh.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 88,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '1',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/niyumi.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 107),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 92,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '2',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/jade.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 113),
                                            child: Text(
                                              'Jade Cabusao',
                                              style: Poppins.userName.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 177),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 23,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '3',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/vaugh.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 88,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '1',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/niyumi.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 107),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 92,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '2',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/jade.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 113),
                                            child: Text(
                                              'Jade Cabusao',
                                              style: Poppins.userName.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 177),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 23,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '3',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/vaugh.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 88,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '1',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/niyumi.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 107),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 92,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '2',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/jade.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 113),
                                            child: Text(
                                              'Jade Cabusao',
                                              style: Poppins.userName.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 177),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 23,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '3',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/vaugh.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 88,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '1',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/niyumi.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 107),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 92,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '2',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          
                                //Farmer name, date of barter transaction, number of barters
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //Farmer profile
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/jade.png'),
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
                                            padding: const EdgeInsets.only(
                                                right: 113),
                                            child: Text(
                                              'Jade Cabusao',
                                              style: Poppins.userName.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 177),
                                            child: Text(
                                              'Farmer',
                                              style:
                                                  Poppins.detailsText.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 23,
                                      ),
                          
                                      //Date
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '8/17/2023',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      ),
                          
                                      //Number barter
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 110),
                                        child: Text(
                                          '3',
                                          style: Poppins.detailsText.copyWith(
                                            color: const Color(0xFF09041B),
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
                  ],
                ),
              ),
            ),
          ),

          //Third expanded division which contains the navigation options of the reports page
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

                //Column for the chat and notification buttons
                child: Column(
                  children: [
                    //Row for the buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Chat button
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/icons/chat.png'),
                              iconSize: 23,
                            ),
                            const SizedBox(
                              width: 15,
                            ),

                            //Notification button
                            IconButton(
                              onPressed: () {},
                              icon:
                                  Image.asset('assets/icons/notification.png'),
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),

                    //Platform icon and label
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.platformPage);
                              },
                              child: const ReportsText(
                                myText: 'Platform Reports',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/platform.png'),
                              height: 23,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Barter icon and label
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.barterPage);
                              },
                              child: const ReportsText(
                                myText: 'Barter Transactions',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/barter.png'),
                              height: 23,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Selling icon and label
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.sellingPage);
                              },
                              child: const ReportsText(
                                myText: 'Selling Transactions',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/selling.png'),
                              height: 22,
                              width: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Number of users icon and label
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.numberPage);
                              },
                              child: const ReportsText(
                                myText: 'Number of Users',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/number.png'),
                              height: 21,
                              width: 21,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Admin logs icon and label
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.logsPage);
                              },
                              child: const ReportsText(
                                myText: 'Admin Logs',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage('assets/icons/logs.png'),
                              height: 22,
                              width: 22,
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
        ],
      ),
    );
  }
}
