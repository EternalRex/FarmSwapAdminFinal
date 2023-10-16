import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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

// ignore: must_be_immutable
class AdminSpecificDetailsWrapper extends StatefulWidget {
  const AdminSpecificDetailsWrapper({super.key, required this.documentID});
  final String documentID;
  //DateTime? _dateTime;

  @override
  State<AdminSpecificDetailsWrapper> createState() => _AdminSpecificDetailsWrapperState();
}

class _AdminSpecificDetailsWrapperState extends State<AdminSpecificDetailsWrapper> {
  //this objects is for third expanded
  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    //creates a reference to our database firestore
    CollectionReference adminRef = FirebaseFirestore.instance.collection("AdminUsers");
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
                      Navigator.of(context).pushNamed(RoutesManager.adminAccount);
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
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                          child: Container(
                            height: 700,
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
                                    if (snapshot.connectionState == ConnectionState.done) {
                                      dynamic data = snapshot.data!.data() as dynamic;

                                      //convert the timestamp into datetime
                                      //birthdate is now initialize
                                      //then set the dateformat
                                      Timestamp datatimestamp = data["Birth Date"];
                                      DateTime birthdate = datatimestamp.toDate();
                                      String finalBirthdate =
                                          DateFormat('yyy-MM-dd').format(birthdate);

                                      //then for the registration date convert sad into date time
                                      //initialize then set the dateformat
                                      Timestamp registerdateTM = data["Registration Date"];
                                      DateTime registerDate = registerdateTM.toDate();
                                      String finalRegistrationDate =
                                          DateFormat('yyyy-MM-dd').format(registerDate);

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
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  //this first sizedbox holds the profile Url of the admin users
                                                  //this will also display the picture of the admin users
                                                  SizedBox(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage("${data["profileUrl"]}"),
                                                        radius: 50,
                                                      ),
                                                    ),
                                                  ),

                                                  //this second sizedbox expanded hold the admin users information
                                                  //like first and last name, email address and admin user ID
                                                  SizedBox(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                        children: [
                                                          //this row holds the first name and last name of the admin users
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.center,
                                                            children: [
                                                              Text(
                                                                "${data["First Name"]} ",
                                                                style: Poppins.adminName.copyWith(
                                                                  color: const Color(0xFF09041B),
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              Text(
                                                                "${data["Last Name"]}",
                                                                style: Poppins.adminName.copyWith(
                                                                  color: const Color(0xFF09041B),
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          //this Text holds the admin email address
                                                          Text(
                                                            "${data["Email Address"]}",
                                                            style: Poppins.userName.copyWith(
                                                              color: const Color(0xFF09041B),
                                                            ),
                                                          ),
                                                          //this Text holds the admin user ID
                                                          Text(
                                                            "ID: ${data["User Id"]}",
                                                            style: Poppins.detailsText.copyWith(
                                                              color: const Color(0xFF09041B),
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
                                              height: 500,
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
                                                  Expanded(
                                                    flex: 5,
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: 10, vertical: 10),
                                                      child: Column(
                                                        children: [
                                                          //this row holds the admin user details
                                                          Row(
                                                            children: [
                                                              //this is the first expanded that hold the first half of the admin user details
                                                              Expanded(
                                                                flex: 2,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets.symmetric(
                                                                          horizontal: 10,
                                                                          vertical: 10),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      //a text that holds the text title for the container role
                                                                      Text(
                                                                        'Role',
                                                                        style: Poppins.contentText
                                                                            .copyWith(
                                                                          color:
                                                                              const Color.fromARGB(
                                                                                  255, 55, 54, 56),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 3,
                                                                      ),

                                                                      //a container that holds the value of the user role
                                                                      Container(
                                                                        height: 50,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              const BorderRadius
                                                                                  .all(
                                                                            Radius.circular(5),
                                                                          ),
                                                                          border: Border.all(
                                                                              color:
                                                                                  blackLightActive,
                                                                              strokeAlign: BorderSide
                                                                                  .strokeAlignOutside),
                                                                        ),
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(
                                                                                  8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                "${data["User Role"]}",
                                                                                style: Poppins
                                                                                    .farmerName
                                                                                    .copyWith(
                                                                                        color:
                                                                                            greenNormalHover),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                top: 10),
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          children: [
                                                                            //text title for the container that holds the full name
                                                                            Text(
                                                                              'Full Name',
                                                                              style: Poppins
                                                                                  .contentText
                                                                                  .copyWith(
                                                                                color: const Color
                                                                                    .fromARGB(255,
                                                                                    55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),

                                                                            //this container holds the value of first and last name of the admin user
                                                                            Container(
                                                                              height: 50,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                borderRadius:
                                                                                    const BorderRadius
                                                                                        .all(
                                                                                  Radius.circular(
                                                                                      5),
                                                                                ),
                                                                                border: Border.all(
                                                                                    color:
                                                                                        blackLightActive,
                                                                                    strokeAlign:
                                                                                        BorderSide
                                                                                            .strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets
                                                                                        .all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["First Name"]}",
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                              color:
                                                                                                  greenNormalHover),
                                                                                    ),
                                                                                    Text(
                                                                                      " ${data["Last Name"]}",
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                              color:
                                                                                                  greenNormalHover),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),

                                                                      //this padding holds the value contact number
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                top: 10),
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          children: [
                                                                            //Retrieve the birth place of farmers
                                                                            Text(
                                                                              'Contact Number',
                                                                              style: Poppins
                                                                                  .contentText
                                                                                  .copyWith(
                                                                                color: const Color
                                                                                    .fromARGB(255,
                                                                                    55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                borderRadius:
                                                                                    const BorderRadius
                                                                                        .all(
                                                                                  Radius.circular(
                                                                                      5),
                                                                                ),
                                                                                border: Border.all(
                                                                                    color:
                                                                                        blackLightActive,
                                                                                    strokeAlign:
                                                                                        BorderSide
                                                                                            .strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets
                                                                                        .all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Contact Number"]}",
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                        color:
                                                                                            greenNormalHover,
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
                                                                        height: 10,
                                                                      ),

                                                                      //this padding holds the value registration date
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                top: 10),
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          children: [
                                                                            Text(
                                                                              'Registration Date',
                                                                              style: Poppins
                                                                                  .contentText
                                                                                  .copyWith(
                                                                                color: const Color
                                                                                    .fromARGB(255,
                                                                                    55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                borderRadius:
                                                                                    const BorderRadius
                                                                                        .all(
                                                                                  Radius.circular(
                                                                                      5),
                                                                                ),
                                                                                border: Border.all(
                                                                                    color:
                                                                                        blackLightActive,
                                                                                    strokeAlign:
                                                                                        BorderSide
                                                                                            .strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets
                                                                                        .all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      finalRegistrationDate,
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                              color:
                                                                                                  greenNormalHover),
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
                                                                  padding:
                                                                      const EdgeInsets.symmetric(
                                                                          horizontal: 10,
                                                                          vertical: 10),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      //sizedbox to align the containers/paddings of second expanded
                                                                      //to the first expanded containers/paddings
                                                                      const SizedBox(
                                                                        height: 95,
                                                                      ),

                                                                      //this text holds the text title birth date
                                                                      Text(
                                                                        'Birth Date',
                                                                        style: Poppins.contentText
                                                                            .copyWith(
                                                                          color:
                                                                              const Color.fromARGB(
                                                                                  255, 55, 54, 56),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 3,
                                                                      ),

                                                                      //and a container that holds the value of birthdate of clicked details
                                                                      Container(
                                                                        height: 50,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              const BorderRadius
                                                                                  .all(
                                                                            Radius.circular(5),
                                                                          ),
                                                                          border: Border.all(
                                                                              color:
                                                                                  blackLightActive,
                                                                              strokeAlign: BorderSide
                                                                                  .strokeAlignOutside),
                                                                        ),
                                                                        child: Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(
                                                                                  8.0),
                                                                          child: Row(
                                                                            children: [
                                                                              Text(
                                                                                finalBirthdate,
                                                                                style: Poppins
                                                                                    .farmerName
                                                                                    .copyWith(
                                                                                        color:
                                                                                            greenNormalHover),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),

                                                                      //this padding holds a column of the text title birthplace
                                                                      //and a container that holds the value of birthplace of clicked details
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                top: 10),
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          children: [
                                                                            Text(
                                                                              'Birth Place',
                                                                              style: Poppins
                                                                                  .contentText
                                                                                  .copyWith(
                                                                                color: const Color
                                                                                    .fromARGB(255,
                                                                                    55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                borderRadius:
                                                                                    const BorderRadius
                                                                                        .all(
                                                                                  Radius.circular(
                                                                                      5),
                                                                                ),
                                                                                border: Border.all(
                                                                                    color:
                                                                                        blackLightActive,
                                                                                    strokeAlign:
                                                                                        BorderSide
                                                                                            .strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets
                                                                                        .all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Birth Place"]}",
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                              color:
                                                                                                  greenNormalHover),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 10,
                                                                      ),

                                                                      //this padding holds a column of the text title address
                                                                      //and a container that holds the value of address of clicked details
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                top: 10),
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          children: [
                                                                            Text(
                                                                              'Address',
                                                                              style: Poppins
                                                                                  .contentText
                                                                                  .copyWith(
                                                                                color: const Color
                                                                                    .fromARGB(255,
                                                                                    55, 54, 56),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 3,
                                                                            ),
                                                                            Container(
                                                                              height: 50,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                borderRadius:
                                                                                    const BorderRadius
                                                                                        .all(
                                                                                  Radius.circular(
                                                                                      5),
                                                                                ),
                                                                                border: Border.all(
                                                                                    color:
                                                                                        blackLightActive,
                                                                                    strokeAlign:
                                                                                        BorderSide
                                                                                            .strokeAlignOutside),
                                                                              ),
                                                                              child: Padding(
                                                                                padding:
                                                                                    const EdgeInsets
                                                                                        .all(8.0),
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "${data["Address"]}",
                                                                                      style: Poppins
                                                                                          .farmerName
                                                                                          .copyWith(
                                                                                        color:
                                                                                            greenNormalHover,
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

                                                          const SizedBox(
                                                            height: 5,
                                                          ),

                                                          //update details button
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                              bottom: 15,
                                                            ),
                                                            child: Center(
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.center,
                                                                children: [
                                                                  // ignore: sized_box_for_whitespace
                                                                  Container(
                                                                    height: 50,
                                                                    width: 141,
                                                                    decoration: BoxDecoration(
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
                                                                          offset:
                                                                              const Offset(1, 5),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child: Center(
                                                                      child: TextButton(
                                                                        onPressed: () {
                                                                          //navigator here
                                                                        },
                                                                        child: Text(
                                                                          "Update Details",
                                                                          style: TextStyle(
                                                                            fontFamily: GoogleFonts
                                                                                    .poppins()
                                                                                .fontFamily,
                                                                            fontSize: 15,
                                                                            fontWeight:
                                                                                FontWeight.w900,
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
}
