import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsContentSection/listings_content_description.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsContentSection/listings_details_card.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsContentSection/listings_names.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsLogo/listings_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_chat_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_notification_btn.dart';
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
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    ListingsLogoSideMenu(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
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
            flex: 6,
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
                        //Decorate the expanded area for the main content
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

                          //Column for main content
                          child: const SingleChildScrollView(
                            child: Column(
                              children: [
                                //Content title
                                ListingsContentDescription(),
                          
                                //Farmer name, identity, details button
                                ListingsNames(),
                                ListingsNames(),
                                ListingsNames(),
                                ListingsNames(),
                                ListingsNames(),
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

          //Third expanded division which contains the information of a farmer
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
                child: const Column(
                  children: [
                    //Row for the buttons
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      child: Padding(
                        padding: EdgeInsets.only(left: 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Chat button
                            ListingsChatOptionsBtn(),
                            SizedBox(
                              width: 15,
                            ),

                            //Notification button
                            ListingsNotificationOptionsBtn(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),

                    //Card for promotion request of farmers
                    ListingsDetailsCard(),
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