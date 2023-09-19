import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationContentSection/commu_content_description.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationContentSection/commu_editor.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationContentSection/commu_notif_history.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationLogo/commu_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_reports_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_transactions_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/CommunicationSideMenu_btns/commu_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/widgets/Text/title_text.dart';
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
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    CommuLogoSideMenu(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dashboard icon and label
                    CommuDashboardOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    CommuAdminAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    CommuUserAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    CommuListingsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    CommuTransactionsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    CommuReportsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    CommuDisputeOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    CommuWalletOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    CommuCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    CommuLogoutOptionsBtn(),
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

                          //Communication editor to send to users
                          child: const CommuEditor(),
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
                          child: const SingleChildScrollView(
                            child: Column(
                              children: [
                                //Communication content description title
                                CommuContentDescription(),

                                //Communication row for notification history
                                CommuNotifHistory(),
                                //10 height spacing
                                SizedBox(
                                  height: 10,
                                ),

                                CommuNotifHistory(),
                                //10 height spacing
                                SizedBox(
                                  height: 10,
                                ),

                                CommuNotifHistory(),
                                //10 height spacing
                                SizedBox(
                                  height: 10,
                                ),

                                CommuNotifHistory(),
                                //10 height spacing
                                SizedBox(
                                  height: 10,
                                ),

                                CommuNotifHistory(),
                                //10 height spacing
                                SizedBox(
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