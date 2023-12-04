import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/poppins_text.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/database/archive_reactivate.dart';
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
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/title_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ArchivedSellDetails extends StatefulWidget {
  const ArchivedSellDetails({
    super.key,
    required this.url,
    required this.name,
    required this.disc,
    required this.price,
    required this.quantity,
    required this.status,
    required this.promoted,
    required this.category,
    required this.start,
    required this.end,
    required this.farmerid,
    required this.fname,
    required this.fLname,
    required this.fUname,
    required this.fmunicipal,
    required this.fbarangay,
  });

  final String url;
  final String name;
  final String disc;
  final String price;
  final String quantity;
  final String status;
  final bool promoted;
  final String category;
  final String start;
  final String end;
  final String farmerid;
  final String fname;
  final String fLname;
  final String fUname;
  final String fmunicipal;
  final String fbarangay;

  @override
  State<ArchivedSellDetails> createState() => _ArchivedSellDetailsState();
}

class _ArchivedSellDetailsState extends State<ArchivedSellDetails> {
  ArchiveReactivateListing reactivate = ArchiveReactivateListing();

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

          //second expanded division that contains the content
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFFDA6317),
                    ),
                    splashColor: const Color(0xFFF9A84D),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RoutesManager.listingsPage);
                    },
                  ),
                  title: const TitleText(
                    myText: 'Archived Selling Details',
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
                                  Color(0xFF30BFBF),
                                  Color(0xFF008080),
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
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.promotedListings);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Promoted Listings',
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
                      flex: 5,
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Container(
                                              height: 600,
                                              width: 900,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          widget.url),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 150,
                                            width: 900,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: shadow,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 5),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 5),
                                                        child: Text(
                                                          widget.name,
                                                          style: Poppins
                                                              .commuTitle
                                                              .copyWith(
                                                            color: const Color(
                                                                0xFF09051B),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: SizedBox(
                                                          child: Text(
                                                            widget.disc,
                                                            style: Poppins
                                                                .commuText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09051B),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 40, right: 5),
                                              child: SizedBox(
                                                height: 210,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      /*For Product Quality */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            poppinsText(
                                                              "Quantity:",
                                                              greenDark,
                                                              20,
                                                              FontWeight.w600,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              "${widget.quantity} "
                                                              " kg",
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /*Equivalent Price */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            poppinsText(
                                                              "Equivalent Price:",
                                                              greenDark,
                                                              20,
                                                              FontWeight.w600,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              "₱"
                                                              "${widget.price}",
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /*Start Date*/
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            poppinsText(
                                                              "Start:",
                                                              greenDark,
                                                              20,
                                                              FontWeight.w600,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              widget.start,
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /*End Date*/
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            poppinsText(
                                                              "End:",
                                                              greenDark,
                                                              20,
                                                              FontWeight.w600,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              widget.end,
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
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
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 50, left: 5),
                                              child: SizedBox(
                                                height: 210,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      /**For Status */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .check,
                                                              color:
                                                                  farmSwapTitlegreen,
                                                              size: 30,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              widget.status,
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /**For Promotion */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              (widget.promoted ==
                                                                      false)
                                                                  ? FontAwesomeIcons
                                                                      .xmark
                                                                  : FontAwesomeIcons
                                                                      .check,
                                                              size: 30,
                                                              color: (widget
                                                                          .promoted ==
                                                                      false)
                                                                  ? Colors.red
                                                                  : farmSwapTitlegreen,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              (widget.promoted ==
                                                                      false)
                                                                  ? "Not Promoted"
                                                                  : "Promoted",
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /**Farmer Name */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .person,
                                                              color:
                                                                  farmSwapTitlegreen,
                                                              size: 30,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              "${widget.fname} "
                                                              " ${widget.fLname} "
                                                              " (${widget.fUname})",
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      /**For Place */
                                                      SizedBox(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.place,
                                                              color:
                                                                  farmSwapTitlegreen,
                                                              size: 30,
                                                            ),
                                                            const SizedBox(
                                                              width: 13,
                                                            ),
                                                            poppinsText(
                                                              "${widget.fbarangay} "
                                                              " ${widget.fmunicipal}",
                                                              const Color(
                                                                  0xFF09051C),
                                                              18,
                                                              FontWeight.normal,
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
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //archive button
                                          DecoratedBox(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 250, 175, 0),
                                                  Color.fromARGB(
                                                      255, 255, 128, 0),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
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
                                              onPressed: () {
                                                confirmReactivate();
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Text(
                                                  'Reactivate',
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 18,
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
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

  /*Function for archiving warning message*/
  void confirmReactivate() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: poppinsText(
            "Attention!",
            Colors.red,
            20,
            FontWeight.w500,
          ),
          content: poppinsText(
            "The Listing will be reactivated and will be accessible again!",
            Colors.black,
            13,
            FontWeight.normal,
          ),
          actions: [
            TextButton(
              onPressed: () {
                //An instance for logging admin actions.
                AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();
                //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                final email = FirebaseAuth.instance.currentUser!.email;
                final userId = FirebaseAuth.instance.currentUser!.uid;
                /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                adminLogs.createAdminLogs(
                    email, userId, "Reactivate_Sell_Listing", DateTime.now());
                archiveReactivateListing();
                successReactivate();
              },
              child: poppinsText(
                  "Continue", farmSwapTitlegreen, 20, FontWeight.w500),
            ),
          ],
        );
      },
    );
  }

  /*Function for achiving success message*/
  void successReactivate() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: poppinsText(
            "Reactivation Complete!",
            Colors.red,
            20,
            FontWeight.w500,
          ),
          content: poppinsText(
            "You Reactivated the listing successfully",
            Colors.black,
            13,
            FontWeight.normal,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.listingsPage);
              },
              child: poppinsText(
                  "Continue", farmSwapTitlegreen, 20, FontWeight.w500),
            ),
          ],
        );
      },
    );
  }

  /*Actual function for archiving */
  Future<void> archiveReactivateListing() async {
    await reactivate.archiveReactSelling(
        widget.fUname, widget.url, widget.farmerid);
  }
}
