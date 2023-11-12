import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsLogo/listings_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_reports.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_transactions.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchBarterController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String searchBarterValue = '';

  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchSellController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String searchSellValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //First expanded division of a row
          Expanded(
            flex: 1,
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
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    ListingsLogoSideMenu(),
                    //15 height spacing
                    SizedBox(
                      height: 25,
                    ),

                    //Dashboard icon and label
                    ListingsDashboardOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    ListingsAdminAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    ListingsUserAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    ListingsListingsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    ListingsTransactionsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    ListingsReportsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    ListingsDisputeOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    ListingsWalletOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    ListingsCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    ListingsLogoutOptionsBtn(),
                  ],
                ),
              ),
            ),
          ),

          //Second expanded division that contains the content
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  //Design the page title
                  title: const TitleText(
                    myText: 'Listings',
                    myColor: Color(0xFF09041B),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 250, 175, 0),
                                  Color.fromARGB(255, 255, 128, 0),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
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
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Archived Accounts',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
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
                body: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                            height: 510,
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
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),

                                        //Container for search bar
                                        child: SizedBox(
                                          width: 280,
                                          height: 40,
                                          child: TextField(
                                            controller: searchBarterController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                searchBarterValue = query;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(5),
                                              filled: true,
                                              fillColor: const Color(0xFFF9A84D)
                                                  .withOpacity(0.10),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Search',
                                              prefixIcon: const Icon(
                                                  Icons.search_rounded),
                                              prefixIconColor:
                                                  const Color(0xFFDA6317),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: greenLight,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(0, 1),
                                              )
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              /*Farmers Title */
                                              Text(
                                                'List of Products for Barter',
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SingleChildScrollView(
                                      child: SizedBox(
                                        height: 390,
                                        child: Column(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                            height: 510,
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
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),

                                        //Container for search bar
                                        child: SizedBox(
                                          width: 280,
                                          height: 40,
                                          child: TextField(
                                            controller: searchSellController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                searchSellValue = query;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(5),
                                              filled: true,
                                              fillColor: const Color(0xFFF9A84D)
                                                  .withOpacity(0.10),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Search',
                                              prefixIcon: const Icon(
                                                  Icons.search_rounded),
                                              prefixIconColor:
                                                  const Color(0xFFDA6317),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: greenLight,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(0, 1),
                                              )
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              /*Farmers Title */
                                              Text(
                                                'List of Products for Selling',
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*SingleChildScrollView(
                                      child: SizedBox(
                                        height: 390,
                                        child: _buildSellProductsList(),
                                      ),
                                    ),*/
                                  ],
                                ),
                              ],
                            )),
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
