import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/LogsContentSection/logs_content_title.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsLogo/reports_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_adminlogs_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_barter_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_chat_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_notification_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_number_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_platform_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_selling_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_communication_btn.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AdminLogs extends StatefulWidget {
  const AdminLogs({super.key});

  @override
  State<AdminLogs> createState() => _AdminLogs();
}

class _AdminLogs extends State<AdminLogs> {
  final db = FirebaseFirestore.instance;

  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchAdminController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String adminSearchValue = '';

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
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10),

                      //Container for search bar
                      child: SizedBox(
                        width: 250,
                        height: 15,
                        child: TextField(
                          controller: searchAdminController,
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFDA6317), height: 1.5),
                          onSubmitted: (String query) {
                            setState(
                              () {
                                adminSearchValue = query;
                              },
                            );
                          },
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
                body: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
                          child: Container(
                            height: 510,
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

                            child: Column(
                              children: [
                                const Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, bottom: 10),
                                      child: Row(
                                        children: [
                                          LogsContentTitle(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                /*Arranges some text elements and empty spaces in a row, for a header*/
                                Container(
                                  width: 780,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: greenLight,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadow,
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        'User',
                                        style: Poppins.adminName.copyWith(
                                          color: const Color(0xFF09041B),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 200,
                                      ),
                                      Text(
                                        'Date and Time',
                                        style: Poppins.adminName.copyWith(
                                          color: const Color(0xFF09041B),
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 180,
                                      ),
                                      Text(
                                        "Action",
                                        style: Poppins.adminName.copyWith(
                                          color: const Color(0xFF09041B),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),

                                //creates a simple rectangular container with white background color and rounded corners.
                                Container(
                                  width: 800,
                                  height: 385,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      height: 420,
                                      child: _buildAdminList(),
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
                child: const Column(
                  children: [
                    //Row for the buttons
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                      child: Padding(
                        padding: EdgeInsets.only(left: 75, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Chat button
                            ReportsChatOptionsBtn(),
                            SizedBox(
                              width: 5,
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

  //Farmer

  //returns a widget for displaying a list of items.
  Widget _buildAdminList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: db.collection('AdminLogs').orderBy('Activity Date').snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .map<Widget>((document) => _buildAdminListItems(document))
                  .toList(),
            ),
          );
        } else {
          //This is a loading indicator that informs the user that data is being fetched.
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF14BE77),
              ),
            ),
          );
        }
      },
    );
  }

  //responsible for creating a widget to represent a farmer
  Widget _buildAdminListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> admin = document.data() as Map<String, dynamic>;

    //checks if a searchValue variable is not empty
    if (adminSearchValue.isNotEmpty) {
      //checks whether the searchValue matches any of the farmer's attributes
      if (admin['Admin Email'] == adminSearchValue ||
          admin['Admin Activity'] == adminSearchValue ||
          admin['Activity Date'] == adminSearchValue) {
        //Extracts a timestamp called 'Activity Date' from the document.
        Timestamp dateTimestamp = document['Activity Date'];

        //Converts this timestamp to a DateTime object.
        DateTime dateTime = dateTimestamp.toDate();

        //Formats the DateTime as a string in the 'MM/DD/yyyy HH:mm:ss' format
        String dateFinal = DateFormat('MM/dd/yyyy   HH:mm:ss').format(dateTime);

        //displaying a single row in a list
        return Align(
          alignment: Alignment.center,
          child: ListTile(
            title: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  //Row where the profile, first name, last name, and details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "${admin["Admin Email"]}",
                          style: Poppins.userName.copyWith(
                            color: const Color(0xFF09051B),
                          ),
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        //First name of farmer
                        Text(
                          dateFinal,
                          style: Poppins.detailsText.copyWith(
                            color: const Color(0xFF09051B),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        //Last name of farmer
                        Text(
                          "${admin["Admin Activity"]}",
                          style: Poppins.contentText.copyWith(
                            color: const Color(0xFF09051B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    //certain actions or access is restricted for users whose email doesn't match the email associated with the farmer's data
    else if (FirebaseAuth.instance.currentUser!.email != admin['Admin Email']) {
      //Extracts a timestamp called 'Activity Date' from the document.
      Timestamp dateTimestamp = document['Activity Date'];

      //Converts this timestamp to a DateTime object.
      DateTime dateTime = dateTimestamp.toDate();

      //Formats the DateTime as a string in the 'MM/DD/yyyy HH:mm:ss' format
      String dateFinal = DateFormat('MM/dd/yyyy   HH:mm:ss').format(dateTime);

      return Align(
        alignment: Alignment.center,
        child: ListTile(
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                //Row where the profile, first name, last name, and details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "${admin["Admin Email"]}",
                        style: Poppins.userName.copyWith(
                          color: const Color(0xFF09051B),
                        ),
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      //First name of farmer
                      Text(
                        dateFinal,
                        style: Poppins.detailsText.copyWith(
                          color: const Color(0xFF09051B),
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      //Last name of farmer
                      Text(
                        "${admin["Admin Activity"]}",
                        style: Poppins.contentText.copyWith(
                          color: const Color(0xFF09051B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }
}
