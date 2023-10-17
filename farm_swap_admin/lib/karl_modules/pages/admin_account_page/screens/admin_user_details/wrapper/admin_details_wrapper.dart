import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/drop_down_update/update_retrieve_docID.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/widgets/update_Textfield.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_edit_admin_profile_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_recent_activities_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../../../../dashboard_page/widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';
import '../../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import '../../admin_account_wrapper/read_admin_users.dart';
import '../provider/update_dropdown_details_provider.dart';

// ignore: must_be_immutable
class AdminSpecificDetailsWrapper extends StatefulWidget {
  const AdminSpecificDetailsWrapper({super.key, required this.documentID});
  final String documentID;
  //DateTime? _dateTime;

  @override
  State<AdminSpecificDetailsWrapper> createState() =>
      _AdminSpecificDetailsWrapperState();
}

class _AdminSpecificDetailsWrapperState
    extends State<AdminSpecificDetailsWrapper> {
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
                child: const Column(
                  children: [
                    /*THE TITLE AND LOGO IN THE PAGE OPTIONS */
                    DashPageOptionsTitle(),
                    /*30 PXLS SPACE BETWEEN*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL HOLD THE DASHBOARD LOGO AND THE DASHBOARD LABEL */
                    DashBoardOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    DashAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    DashUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    DashListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    DashTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    DashReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    DashDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    DashWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE COMMUNICATIONS ICON AND LABEL */
                    DashCommunicationOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    Spacer(),
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
                    myText: "Admin User Profile",
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
                                                                              "Status",
                                                                              style: Poppins.farmerName.copyWith(color: blackNormal),
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 25,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.circle,
                                                                              color: Colors.green,
                                                                              size: 10,
                                                                            ),
                                                                            Text(
                                                                              "${data["Account Status"]}",
                                                                              style: Poppins.farmerName.copyWith(
                                                                                color: greenNormalHover,
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

                                                          //sizedbox for update details and archive account buttons
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
                                                                //update details button
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
                                                                              141,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                const LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF53E78B),
                                                                                Color(0xFF14BE77)
                                                                              ],
                                                                              begin: Alignment.topLeft,
                                                                              end: Alignment.bottomRight,
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
                                                                              onPressed: () {
                                                                                selectfieldUpdate("${data["User Id"]}");
                                                                              },
                                                                              child: Text(
                                                                                "Update Details",
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
                                                                              141,
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
                                                                              onPressed: () {
                                                                                //navigator here
                                                                              },
                                                                              child: Text(
                                                                                "Archive Account",
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
                    const AdminRecentActivitiesBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? updatedValue;
  String? selectedValue;
  UpdateRetriveDocId updateRetrieve = UpdateRetriveDocId();
  Widget updateLabel = const Text("Type here");
  TextEditingController updateController = TextEditingController();

  void selectfieldUpdate(String passeduid) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text(
                "Choose Field to Update.",
              ),
              content: DropdownButton<String>(
                value: selectedValue,
                items: [
                  //first menu item first name
                  DropdownMenuItem(
                    value: "firstName",
                    child: GestureDetector(
                        child: const Text(
                          "First Name",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter First Name"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateFirstNameField(
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
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
                                );
                              });
                        }),
                  ),

                  //second menu item last name
                  DropdownMenuItem(
                    value: "lastName",
                    child: GestureDetector(
                        child: const Text(
                          "Last Name",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Last Name"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateLastNameField(
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
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
                                );
                              });
                        }),
                  ),

                  //third menu item contact number
                  DropdownMenuItem(
                    value: "contactNumber",
                    child: GestureDetector(
                        child: const Text(
                          "Contact Number",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Contact Number"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateContactNumberField(
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
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
                                );
                              });
                        }),
                  ),

                  //third menu item address
                  DropdownMenuItem(
                    value: "address",
                    child: GestureDetector(
                        child: const Text(
                          "Address",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Address"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateAddressField(
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
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
                                );
                              });
                        }),
                  ),

                  //fourth menu item birthdate
                  DropdownMenuItem(
                    value: "birthdate",
                    child: GestureDetector(
                      child: const Text("Birth Date"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Select Birthdate"),
                              content: SizedBox(
                                height: 30,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: GestureDetector(
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            _selectDateBirth(passeduid);
                                          },
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          label: const Text(
                                            'Select Date',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(10),
                                            fixedSize: const Size(
                                              180,
                                              20,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.black,
                                            elevation: 15,
                                            shadowColor: shadow,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //Update field button
                                        DecoratedBox(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF53E78B),
                                                Color(0xFF14BE77),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(17.50),
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
                                              updateBirthdate(
                                                  birthdate, passeduid);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Text(
                                                'Update Field',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
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
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),

                  //fifth menu item birth place
                  DropdownMenuItem(
                    value: "birthplace",
                    child: GestureDetector(
                        child: const Text(
                          "Birth Place",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Birth Place"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateBirthplaceField(
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
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
                                );
                              });
                        }),
                  ),

                  //sixth menu item registration date
                  DropdownMenuItem(
                    value: "registrationdate",
                    child: GestureDetector(
                      child: const Text("Registration Date"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Select Registration Date"),
                              content: SizedBox(
                                height: 30,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: GestureDetector(
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            _selectDateReg(passeduid);
                                          },
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          label: const Text(
                                            'Select Date',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(10),
                                            fixedSize: const Size(
                                              180,
                                              20,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.black,
                                            elevation: 15,
                                            shadowColor: shadow,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //Update field button
                                        DecoratedBox(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF53E78B),
                                                Color(0xFF14BE77),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(17.50),
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
                                              updateRegistrationDate(
                                                  registerdate, passeduid);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Text(
                                                'Update Field',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
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
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
                onChanged: (value) {
                  selectedValue = value;
                  Provider.of<UpdateAdminDropDownHint>(context, listen: false)
                      .setHint(value!);
                },
              ));
        });
  }

  //creating a function called updated firstname field to update the first name from the database
  Future<void> updateFirstNameField(String? updatedata, String userid) async {
    //calling the getUpdateddocID function from the class UpdateRetrieve
    await updateRetrieve.getUpdateDocId(userid);

    /*Tapo didto gihapon sa  UpdateFirstNameRetriveDocId na clas ang kanang function na atong bag e gi call
    mo return nag string value which is ang documentid nga iyang gi butang sa variable nga mydocid*/
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"First Name": updatedata};

    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateLastNameField is the same process as what the other function does
  Future<void> updateLastNameField(String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Last Name": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateAddressField is the same process as what the other function does
  Future<void> updateAddressField(String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);

    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Address": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateContactNumberField is the same process as what the other function does
  Future<void> updateContactNumberField(
      String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Contact Number": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateBirthplace field is the same process as what the other function does
  Future<void> updateBirthplaceField(String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Birth Place": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //create a variable date time for the register date nad birthdate
  DateTime registerdate = DateTime.now();
  DateTime birthdate = DateTime.now();

  /*Function for selecting a birth date */
  Future<void> _selectDateBirth(String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != birthdate) {
      setState(() {
        birthdate = pickedDate;
      });
    }
  }

  /*Function for selecting a registration date */
  Future<void> _selectDateReg(String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: registerdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != registerdate) {
      setState(() {
        registerdate = pickedDate;
      });
    }
  }

  /*Function for updating birthdate*/
  Future<void> updateBirthdate(DateTime updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);
    final updateFiled = {"Birth Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  /*Function for updating registration date */
  Future<void> updateRegistrationDate(
      DateTime updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);
    final updateFiled = {"Registration Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }
}
