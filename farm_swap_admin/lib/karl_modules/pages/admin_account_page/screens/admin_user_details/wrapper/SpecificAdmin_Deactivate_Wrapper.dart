import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';
import '../../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import '../../admin_account_logs/database/admin_logs_insert.dart';
import '../../admin_account_wrapper/read_admin_users.dart';
import '../admin_deactivate_user/specific_ReactivateRetrived_DocID.dart';
import '../widgets/details_buttons/archive__details_btn.dart';
import '../widgets/details_buttons/deactivate__details_btn.dart';
import '../widgets/details_buttons/update_details_btn.dart';

// ignore: must_be_immutable
class SpecificAdminDeactivateWrapper extends StatefulWidget {
  SpecificAdminDeactivateWrapper({
    super.key,
    required this.documentID,
  });
  final String documentID;
  String selectedId = "";
  //DateTime? _dateTime;

  @override
  State<SpecificAdminDeactivateWrapper> createState() =>
      _AdminSpecificDeactivateWrapperState();
}

class _AdminSpecificDeactivateWrapperState
    extends State<SpecificAdminDeactivateWrapper> {
  //this objects is for third expanded
  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
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
                    myText: "Admin User Deactivate Account",
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

                                //this is the admin user details
                                FutureBuilder<DocumentSnapshot>(
                                  future: adminRef.doc(widget.documentID).get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      dynamic data =
                                          snapshot.data!.data() as dynamic;

                                      //convert the timestamp into datetime
                                      //birthdate is now initialize
                                      //then set the dateformat
                                      Timestamp datatimestamp =
                                          data["Birth Date"];
                                      DateTime birthdate =
                                          datatimestamp.toDate();
                                      String finalBirthdate =
                                          DateFormat('yyy-MM-dd')
                                              .format(birthdate);

                                      //then for the registration date convert sad into date time
                                      //initialize then set the dateformat
                                      Timestamp registerdateTM =
                                          data["Registration Date"];
                                      DateTime registerDate =
                                          registerdateTM.toDate();
                                      String finalRegistrationDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(registerDate);

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
                                                          //this padding holds the value admin user status
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10),
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          200,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            const BorderRadius.all(
                                                                          Radius.circular(
                                                                              10),
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                shadow,
                                                                            blurRadius:
                                                                                1,
                                                                            offset:
                                                                                const Offset(0, 1),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      //this padding holds the status name and account status of specific admin
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "Status : ",
                                                                              style: Poppins.farmerName.copyWith(color: blackNormal),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 14,
                                                                            ),
                                                                            Text(
                                                                              "${data["Account Status"]}",
                                                                              style: Poppins.farmerName.copyWith(
                                                                                color: Colors.orange,
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

                                                          //this row holds the admin user details
                                                          Row(
                                                            children: [
                                                              //this is the first expanded that hold the first half of the admin user details
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 5,
                                                                  ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      //this padding holds a column of the text title role
                                                                      //and a container that holds the value of admin user role
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Role',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: blackLightActive,
                                                                                  strokeAlign: BorderSide.strokeAlignOutside,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["User Role"]}",
                                                                                      style: Poppins.farmerName.copyWith(
                                                                                        color: greenNormalHover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds a column of the text title first name
                                                                      //and a container that holds the value of admin user first name
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'First Name',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: blackLightActive,
                                                                                  strokeAlign: BorderSide.strokeAlignOutside,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["First Name"]}",
                                                                                      style: Poppins.farmerName.copyWith(
                                                                                        color: greenNormalHover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds a column of the text title last name
                                                                      //and a container that holds the value of admin user last name
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Last Name',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: blackLightActive,
                                                                                  strokeAlign: BorderSide.strokeAlignOutside,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Last Name"]}",
                                                                                      style: Poppins.farmerName.copyWith(
                                                                                        color: greenNormalHover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds the value contact number
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            //Retrieve the birth place of farmers
                                                                            Text(
                                                                              'Contact Number',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(color: blackLightActive, strokeAlign: BorderSide.strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Contact Number"]}",
                                                                                      style: Poppins.farmerName.copyWith(
                                                                                        color: greenNormalHover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
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

                                                              //this is the second expanded that hold half of the admin user details
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          10),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      //this padding holds a column of the text title address
                                                                      //and a container that holds the value of address of clicked details
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Address',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(color: blackLightActive, strokeAlign: BorderSide.strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Address"]}",
                                                                                      style: Poppins.farmerName.copyWith(
                                                                                        color: greenNormalHover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds a column of the text title birthplace
                                                                      //and a container that holds the value of birthplace of clicked details
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Birth Place',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(color: blackLightActive, strokeAlign: BorderSide.strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Birth Place"]}",
                                                                                      style: Poppins.farmerName.copyWith(color: greenNormalHover),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds the value birth date
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Birth Date',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(color: blackLightActive, strokeAlign: BorderSide.strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      finalBirthdate,
                                                                                      style: Poppins.farmerName.copyWith(color: greenNormalHover),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),

                                                                      //this padding holds the value registration date
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Registration Date',
                                                                              style: Poppins.contentText.copyWith(
                                                                                color: const Color.fromARGB(255, 55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                                border: Border.all(
                                                                                  color: blackLightActive,
                                                                                  strokeAlign: BorderSide.strokeAlignOutside,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      finalRegistrationDate,
                                                                                      style: Poppins.farmerName.copyWith(color: greenNormalHover),
                                                                                    ),
                                                                                  ],
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
                                                            ],
                                                          ),

                                                          const SizedBox(
                                                            height: 10,
                                                          ),

                                                          //sizedbox for archive account buttons
                                                          SizedBox(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const SizedBox(
                                                                  height: 3,
                                                                ),

                                                                const SizedBox(
                                                                  width: 3,
                                                                ),
                                                                const SizedBox(
                                                                    width: 5),
                                                                //Archive account button
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    bottom: 15,
                                                                  ),
                                                                  child: Center(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        // ignore: sized_box_for_whitespace
                                                                        Container(
                                                                          height:
                                                                              50,
                                                                          width:
                                                                              230,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                const LinearGradient(
                                                                              begin: Alignment(0.99, -0.15),
                                                                              end: Alignment(-0.99, 0.15),
                                                                              colors: [
                                                                                Color(0xFFE21B1B),
                                                                                Color(0xEEFF9012),
                                                                              ],
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.all(
                                                                              Radius.circular(15),
                                                                            ),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                color: shadow,
                                                                                blurRadius: 5,
                                                                                offset: const Offset(1, 5),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                TextButton(
                                                                              onPressed: () async {
                                                                                setState(() {
                                                                                  widget.selectedId = "${data["User Id"]}";
                                                                                  print(widget.selectedId);
                                                                                });

                                                                                //create logs here where the account status filed will be set to active
                                                                                await updateField("Requesting", widget.selectedId);

                                                                                //this will navigate to admin details.dart
                                                                                Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
                                                                              },
                                                                              child: Text(
                                                                                "Reactivate Account",
                                                                                style: TextStyle(
                                                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                                                  fontSize: 15,
                                                                                  fontWeight: FontWeight.w900,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
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
                          /*PROFILE TEXT */
                          const SizedBox(
                            width: 82,
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
                      height: 150,
                    ),
                    const UpdateAdminBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ArchiveAdminBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const DeactivateAccountBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//create a varaible for the current user in making admin logs
  final email = FirebaseAuth.instance.currentUser!.email;
  final userID = FirebaseAuth.instance.currentUser!.uid;

  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

// Function to update a field in a document which is the account status
  Future<void> updateField(String? updatedata, String userId) async {
    // Create an instance of the class to retrieve the document ID
    ReactivateRetrieveDocId updateRetrieve = ReactivateRetrieveDocId();

    // Call the function to get the document ID
    await updateRetrieve.getUpdateDocId(userId);

    // Create a document reference
    final documentRef = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    // Define the data to update which is the account status
    final updateData = {
      'Account Status': updatedata,
    };

    // Create an admin log with the description Reactivate_Admin_Account
    // adminLogs.createAdminLogs(
    //   email, userID, "Reactivate_Admin_Account", DateTime.now());

    try {
      // Update the Firestore document with the new data
      await documentRef.update(updateData);
      print("Document updated successfully.");
    } catch (e) {
      print("Error while updating document: $e");
    }
  }
}
