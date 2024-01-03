import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/NumberContentExpanded/number_consumers.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/NumberContentExpanded/number_farmers.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/NumberContentExpanded/number_newusers.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/NumberContentExpanded/number_overallusers.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/NumberContentSection/number_content_title.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsLogo/reports_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_adminlogs_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_barter_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_number_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_selling_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_reports_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_transactions_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/ReportsRightMenu_btns/reports_revenue_btn.dart';

class NumberUsers extends StatefulWidget {
  const NumberUsers({super.key});

  @override
  State<NumberUsers> createState() => _NumberUsers();
}

class _NumberUsers extends State<NumberUsers> {
  late String currAdminId;
  late String currAdminRole = "";
  late String currDocId;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await getUserDocumentId();
    await fetchUserRole();
  }

  Future<void> getUserDocumentId() async {
    currAdminId = FirebaseAuth.instance.currentUser!.uid;

    QuerySnapshot adminUsersQuery = await FirebaseFirestore.instance
        .collection('AdminUsers')
        .where('User Id', isEqualTo: currAdminId)
        .get();

    if (adminUsersQuery.docs.isNotEmpty) {
      currDocId = adminUsersQuery.docs[0].id;
      await fetchUserRole();
    } else {
      print('No matching document found for the current user');
    }
  }

  Future<void> fetchUserRole() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(currDocId)
        .get();

    if (userSnapshot.exists) {
      setState(() {
        currAdminRole = userSnapshot['User Role'];
      });
      // Do other things as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creating a row consist of 3 expanded divisions
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
                    ReportsLogoSideMenu(),
                    SizedBox(
                      height: 25,
                    ),

                    //Dashboard icon and label
                    ReportsDashboardOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    ReportsAdminAccountOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    ReportsUserAccountOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    ReportsListingsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    ReportsTransactionsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    ReportsReportsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    ReportsDisputeOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    ReportsWalletOptionsBtn(),
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
            flex: 4,
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

                          child: const Column(
                            children: [
                              NumberContentTitle(),
                              SizedBox(
                                height: 20,
                              ),

                              //Row for 2 expanded container
                              //Row1
                              Row(
                                children: [
                                  //Expanded container 1
                                  NumberOverallUsers(),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),

                                  //Expanded container 2
                                  NumberNewUsers(),
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
                                  NumberFarmers(),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),

                                  //Expanded container 4
                                  NumberConsumers(),
                                ],
                              ),
                            ],
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

                //Column for the chat and notification buttons
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),

                    //Number of users icon and label
                    const ReportsNumberOptionsBtn(),
                    const SizedBox(
                      height: 25,
                    ),

                    //Platform icon and label
                    const ReportsRevenueOptionsBtn(),
                    const SizedBox(
                      height: 25,
                    ),

                    //Barter icon and label
                    const ReportsBarterOptionsBtn(),
                    const SizedBox(
                      height: 25,
                    ),

                    //Selling icon and label
                    const ReportsSellingOptionsBtn(),
                    const SizedBox(
                      height: 25,
                    ),

                    /**if currAdminRole is true then this button 
                     * will show but if it is false it wont show */
                    if (currAdminRole == "superadmin")
                      //Admin logs icon and label
                      const ReportsAdminLogsOptionsBtn(),
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
