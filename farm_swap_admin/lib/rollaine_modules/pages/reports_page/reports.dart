import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentExpanded/reports_interface.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentExpanded/reports_suggestions.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentExpanded/reports_usability.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentExpanded/reports_userSatisfaction.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentSection/reports_content_comments.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentSection/reports_content_description.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsContentSection/reports_content_suggestions.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsLogo/reports_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_adminlogs_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_barter_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_number_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_platform_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_selling_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_chat_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_notification_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_reports_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_transactions_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
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
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    ReportsLogoSideMenu(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dashboard icon and label
                    ReportsDashboardOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    ReportsAdminAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    ReportsUserAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    ReportsListingsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    ReportsTransactionsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    ReportsReportsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    ReportsDisputeOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    ReportsWalletOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    ReportsCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    ReportsLogoutOptionsBtn(),
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

                          child: const SingleChildScrollView(
                            child: Column(
                              children: [
                                //Report content description title
                                ReportsContentDescription(),
                          
                                //Row for 2 expanded container
                                //Row1
                                Row(
                                  children: [
                                    //Expanded container 1
                                    ReportsUserSatisfaction(),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    //Expanded container 2
                                    ReportsUsability(),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                          
                                //Row for 2 expanded container
                                //Row 2
                                Row(
                                  children: [
                                    //Expanded container 3
                                    ReportsInterface(),
                                    SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    //Expanded container 4
                                    ReportsSuggestions(),
                                  ],
                                ),
                          
                                //Suggestions
                                ReportsContentSuggestions(),
                                //First comment
                                ReportsComments(),
                                ReportsComments(),
                                ReportsComments(),
                                ReportsComments(),
                                ReportsComments(),
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
                            ReportsChatOptionsBtn(),
                            //15 height spacing
                            SizedBox(
                              width: 15,
                            ),
                            //Notification button
                            ReportsNotificationOptionsBtn(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),

                    //Platform icon and label
                    ReportsPlatformOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Barter icon and label
                    ReportsBarterOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Selling icon and label
                    ReportsSellingOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Number of users icon and label
                    ReportsNumberOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Admin logs icon and label
                    ReportsAdminLogsOptionsBtn(),
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