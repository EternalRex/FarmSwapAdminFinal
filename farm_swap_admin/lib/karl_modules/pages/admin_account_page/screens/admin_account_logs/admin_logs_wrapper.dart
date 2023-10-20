import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../constants/Colors/colors_rollaine.dart';
import '../../../dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import '../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_edit_admin_profile_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_recent_activities_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';
import '../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

// ignore: must_be_immutable
class AdminLogsSpecificWrapper extends StatefulWidget {
  AdminLogsSpecificWrapper({
    super.key,
    this.documentID,
  });
  final String? documentID;
  String selectedId = "";
  @override
  State<AdminLogsSpecificWrapper> createState() =>
      _AdminLogsSpecificWrapperState();
}

class _AdminLogsSpecificWrapperState extends State<AdminLogsSpecificWrapper> {
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    //creates a reference to our database firestore
    CollectionReference adminRef =
        FirebaseFirestore.instance.collection("AdminUsers");

    return Scaffold(
      body: Row(
        children: [
          /*FIRST EXPANDED THAT WILL CONTAIN ALL THE NAVIGATION */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                /*DECORATING THE CONTAINER */
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*A COLUMN THAT WILL HOLD THE NAVIGATIONS OPTIONS */
                child: Column(
                  children: [
                    /*THE TITLE AND LOGO IN THE PAGE OPTIONS */
                    const DashPageOptionsTitle(),
                    /*30 PXLS SPACE BETWEEN*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL HOLD THE DASHBOARD LOGO AND THE DASHBOARD LABEL */
                    const DashBoardOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    const DashAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    const DashUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    const DashListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    const DashTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    const DashReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    const DashDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    const DashWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE COMMUNICATIONS ICON AND LABEL */
                    const DashCommunicationOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const Spacer(),
                    /*THIS ROW WILL CONTAIN THE lOGOUT ICON AND LABEL */
                    DashLogoutOptionBtn(),
                  ],
                ),
              ),
            ),
          ),

          /*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
          Expanded(
            flex: 4,
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
                          .pushNamed(RoutesManager.adminAccount);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Admin User Activity",
                    myColor: Color(0xFF09041B),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                ),
                body: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 15,
                          ),
                          child: Container(
                            height: 800,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
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
                                const SizedBox(
                                  height: 30,
                                ),

                                //this is the specific admin activity
                                FutureBuilder<DocumentSnapshot>(
                                  future: adminRef.doc(widget.documentID).get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      dynamic data =
                                          snapshot.data!.data() as dynamic;
                                      /**
                                       * This declare the final variable specificEmails of type List<String> 
                                       * and assigns the list with the email address to it.
                                       */
                                      final List<String> specificEmails = [
                                        data["Email Address"]
                                      ];

                                      return Column(
                                        children: [
                                          //first column that holds the important details of an admin user
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 800,
                                              height: 145,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //this first sizedbox holds the profile Url of the admin users
                                                  //this will also display the picture of the admin users
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "${data["profileUrl"]}"),
                                                        radius: 50,
                                                      ),
                                                    ),
                                                  ),

                                                  //this second sizedbox expanded hold the admin users information
                                                  //like first and last name, email address and admin user ID
                                                  SizedBox(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          //this row holds the first name and last name of the admin users
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "${data["First Name"]} ",
                                                                style: Poppins
                                                                    .adminName
                                                                    .copyWith(
                                                                  color: const Color(
                                                                      0xFF09041B),
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              Text(
                                                                "${data["Last Name"]}",
                                                                style: Poppins
                                                                    .adminName
                                                                    .copyWith(
                                                                  color: const Color(
                                                                      0xFF09041B),
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          //this Text holds the admin email address
                                                          Text(
                                                            "${data["Email Address"]}",
                                                            style: Poppins
                                                                .userName
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                          //this Text holds the admin user ID
                                                          Text(
                                                            "ID: ${data["User Id"]}",
                                                            style: Poppins
                                                                .detailsText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
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
                                          const SizedBox(
                                            height: 10,
                                          ),

                                          //putting container inside align to center the container
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 800,
                                              height: 600,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                                  Expanded(
                                                    flex: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 10),
                                                      child: Column(
                                                        children: [
                                                          //this is for setting the search bar to center right
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),

                                                              //Container for search bar
                                                              child: SizedBox(
                                                                width: 250,
                                                                height: 25,
                                                                child:
                                                                    TextField(
                                                                  style: GoogleFonts.poppins(
                                                                      color: const Color(
                                                                          0xFFDA6317),
                                                                      height:
                                                                          1.5),
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            5),
                                                                    filled:
                                                                        true,
                                                                    fillColor: const Color(
                                                                            0xFFF9A84D)
                                                                        .withOpacity(
                                                                            0.10),
                                                                    border:
                                                                        const OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            10),
                                                                      ),
                                                                      borderSide:
                                                                          BorderSide
                                                                              .none,
                                                                    ),
                                                                    hintText:
                                                                        'Search here...',
                                                                    prefixIcon:
                                                                        const Icon(
                                                                            Icons.search_rounded),
                                                                    prefixIconColor:
                                                                        const Color(
                                                                            0xFFDA6317),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          //this container serves as the header
                                                          //this holds the title header
                                                          Container(
                                                            width: 780,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  188,
                                                                  241,
                                                                  189),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: shadow,
                                                                  blurRadius: 2,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 1),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 50,
                                                                ),
                                                                Text(
                                                                  "User",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 230,
                                                                ),
                                                                Text(
                                                                  "Date and Time",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 150,
                                                                ),
                                                                Text(
                                                                  "Action",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 3,
                                                          ),
                                                          /**
                                                           * this container has the value of admin logs
                                                           * this logs is for the specific admin
                                                           */
                                                          Container(
                                                            width: 780,
                                                            height: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: shadow,
                                                                  blurRadius: 2,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 1),
                                                                ),
                                                              ],
                                                            ),

                                                            /**
                                                             * the streambuilder will listen the changes
                                                             * of AdminLogs collection in the firebase 
                                                             */
                                                            child:
                                                                StreamBuilder(
                                                              stream: FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'AdminLogs')
                                                                  .snapshots(),
                                                              builder: (context,
                                                                  snapshot) {
                                                                /**
                                                                     * This condition checks whether the snapshot contains data. 
                                                                     * If it doesn't, it returns a CircularProgressIndicator, 
                                                                     * which is a loading spinner.
                                                                     */
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return const CircularProgressIndicator();
                                                                }

                                                                /**
                                                                 * documents is a list of QueryDocumentSnapshot 
                                                                 * objects retrieved from the snapshot.data!.docs property.
                                                                 *  It contains the documents in the 'AdminLogs' collection.
                                                                 */
                                                                final List<
                                                                        QueryDocumentSnapshot>
                                                                    documents =
                                                                    snapshot
                                                                        .data!
                                                                        .docs;

                                                                final filteredDocuments =
                                                                    documents
                                                                        .where(
                                                                            (doc) {
                                                                  // Check if the 'email' field of the document matches one of the specific emails
                                                                  return specificEmails
                                                                      .contains(
                                                                          doc['Admin Email']);
                                                                }).toList();

                                                                /**
                                                                 * if the filtered document is empty
                                                                 * it will return the center
                                                                 * where it show no data available
                                                                 */
                                                                if (filteredDocuments
                                                                    .isEmpty) {
                                                                  return const Center(
                                                                    child: Text(
                                                                        "No data available"),
                                                                  );
                                                                }

                                                                /**
                                                                 * This is a widget used to build a scrollable list. 
                                                                 * It takes the filtered documents and builds a ListTile for each of them.
                                                                 */
                                                                return ListView
                                                                    .builder(
                                                                  itemCount:
                                                                      filteredDocuments
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    final document =
                                                                        filteredDocuments[
                                                                            index];
                                                                    Timestamp
                                                                        dateTimestamp =
                                                                        document[
                                                                            "Activity Date"];
                                                                    DateTime
                                                                        dateTime =
                                                                        dateTimestamp
                                                                            .toDate();
                                                                    String
                                                                        dateFinal =
                                                                        DateFormat('yyyy-MM-DD HH:mm:ss')
                                                                            .format(dateTime);

                                                                    /**
                                                                     * this listtile uses a Row with multiple Text widgets to display information 
                                                                     * about each document, 
                                                                     * including the 'Admin Email', 'Activity Date', and 'Admin Activity'.
                                                                    */
                                                                    return ListTile(
                                                                      title:
                                                                          Row(
                                                                        children: [
                                                                          const SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              "${document["Admin Email"]} ",
                                                                              style: Poppins.adminName.copyWith(
                                                                                color: const Color(0xFF09041B),
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                30,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              " $dateFinal ",
                                                                              style: Poppins.adminName.copyWith(
                                                                                color: const Color(0xFF09041B),
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                50,
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              " ${document["Admin Activity"]}",
                                                                              style: Poppins.adminName.copyWith(
                                                                                color: const Color(0xFF09041B),
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
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
                                        ],
                                      );
                                    } else {
                                      return const CircularProgressIndicator(
                                        color: Colors.green,
                                      );
                                    }
                                  },
                                ),

                                const SizedBox(
                                  height: 10,
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

          /*THIRD EXPANDED THAT WILL HOLD THE EDIT PROFILE */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*COLUMN THAT WILL CONTAIN EVERY ITEM OF THIS EXPANDED */
                child: Column(
                  children: [
                    /*FIRST ROW OF THE COLUMN THAT WILL HOLD THE PROFILE LABEL, THE MESSAGE 
                    AND THE NOTIFICATION ICON*/
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          /*PROFILE TEXT */
                          DashBoardTxt(
                            myText: "Profile",
                            myColor: const Color(0xFF09041B),
                            mySize: 15,
                            myFont: GoogleFonts.poppins().fontFamily,
                            myWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            width: 34,
                          ),
                          /*MESSAGE BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.envelope,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                          /*NOTIFICATIOIN BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    /*SECOND ROW THAT WILL CONTAIN THE PROFILE PICTURE AND ID */

                    /*In this future builder we will get the document id that we get from
                    the database querry in the dashboardquery file */
                    FutureBuilder(
                      /*The id was the object we creted above to access the methods inside the dashboard
                      query file. we call the get docsId() method, meaning  we tell it to execute and
                      get the document id of the current user */
                      future: id.getDocsId(),

                      /*so this builder means that it will build the context meaning this page
                      and this class. It will also build the snapshot, which is the object
                      that we use to acces the data fom getDocsID() method */
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          /*Since the getDocsId is a Future<sting> it will return a the 
                          documentId but in a futue form so not the actual string so we 
                          need this snaphot to actually get the string and not the future form*/
                          String data = snapshot.data!;
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*We call the profilephoto class from ourr dashboard profileinfo and then
                                pass the variable data that has the documentid string form*/
                                ProfilePhoto(documentId: data),
                              ],
                            ),
                          );
                        } else {
                          /*If the data is not yet given so it will display no data until data is presented */
                          return const Text("No data");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    /*THE NAME OF THE USER, This future builder will display the name of the current uer
                    its ways ae simillar above */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProfileName(documentId: data),
                              ],
                            ),
                          );
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),

                    /*ID OF THE USER,This future builder will display the name of the current uer
                    its ways ae simillar above */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return ProfileId(documentId: data);
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /*EDIT PROFILE BUTTON */
                    const AdminEditProfileBtn(),
                    const SizedBox(
                      height: 30,
                    ),
                    /*ADMIN RECENT ACTIVITIES BUTTON */
                    AdminRecentActivitiesBtn(),
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
