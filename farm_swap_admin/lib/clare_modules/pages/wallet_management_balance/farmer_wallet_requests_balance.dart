// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../../constants/Colors/colors.dart';
import '../../../karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'widget/wallet_farmer_retrieveDocId.dart';
import 'widget/wallet_textbuttons_user.dart';
import 'widget/wallet_textfield.dart';

// ignore: must_be_immutable
class RequestBalanceFarmerLists extends StatefulWidget {
  RequestBalanceFarmerLists({
    super.key,
    this.documentID,
  });
  final String? documentID;
  String selectedId = "";
  String cashOutselectedId = "";

  @override
  State<RequestBalanceFarmerLists> createState() =>
      _RequestBalanceFarmerListsState();
}

class _RequestBalanceFarmerListsState extends State<RequestBalanceFarmerLists> {
  final GetAllAdminRequests getAllAdminRequests = GetAllAdminRequests();
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();
  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
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
                //this calls the dashboard buttons nga naa tanan side menu button
                child: const DashBoardExpanded1Item(),
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
                      Navigator.of(context).pushNamed(RoutesManager.dashboard);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Farmer Wallet",
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
                          controller: searchController,
                          style: GoogleFonts.poppins(
                              color: const Color(0xFFDA6317), height: 1.5),
                          onSubmitted: (String query) {
                            setState(
                              () {
                                searchValue = query;
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
                body: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
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
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),

                                      //this padding holds the content title
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35, top: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Farmer Requests',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 600,
                                  child: _buildUserList(),
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
                    const SizedBox(
                      height: 15,
                    ),
                    const FarmerWalletRequestsListBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ConsumerWalletRequestsListBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //this will show the collection that has a status equal to pending
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerWallet')
          .where('status', whereIn: ['pending']).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Displaying a loading indicator while waiting for data.
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final logs = snapshot.data!.docs;

          if (logs.isEmpty) {
            return const Center(
              child: Text('No farmer wallet request available!'),
            );
          }

          // This will sort the documents based on the 'dateTime' field
          logs.sort((a, b) {
            var dateTimeA = a['dateTime'];
            var dateTimeB = b['dateTime'];

            //This will check if the dateTime field is a Timestamp and convert to DateTime
            if (dateTimeA is Timestamp) {
              dateTimeA = dateTimeA.toDate();
            }

            if (dateTimeB is Timestamp) {
              dateTimeB = dateTimeB.toDate();
            }
            // this will perform the descending order base on the date and its time
            return (dateTimeB as DateTime).compareTo(dateTimeA as DateTime);
          });

          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: logs.map<Widget>((document) {
                return _buildUserListItems(document);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildUserListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    TextEditingController amountController = TextEditingController();
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('yyyy-MM-dd').format(dateTime);

    UpdateWallet wallet = UpdateWallet();

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["request"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: GestureDetector(
            child: Container(
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
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            //this padding holds the profile image of the farmer
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: //this will display the users profile picture in each listtile
                                  CachedNetworkImage(
                                imageUrl: data["profilePhoto"] ??
                                    "", // Provide a default empty string if it's null
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  backgroundImage: imageProvider,
                                  radius: 20,
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),

                            //this column holds the admin users info
                            //like firstname, lastname and address
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //first column that holds the admin user firstname and username
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Text(
                                        "${data["firstname"]} ",
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "${data["lastname"]}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //second column that holds the admin user address
                                Text(
                                  "${data["address"]}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Row(
                          children: [
                            const Text(
                              "Request : ",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${data["request"]}",
                              style: Poppins.contentText.copyWith(
                                color: const Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),

                      //sizedbox for reviewing request button of farmer wallet request
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
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
                                    Radius.circular(10),
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
                                  onPressed: () async {
                                    setState(() {
                                      widget.selectedId =
                                          "${document["userId"]}";
                                    });

                                    String requestType = document["request"];

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Note!"),
                                          content: Text(
                                              "This account is requesting for ${document["request"]}"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Ok"),
                                              onPressed: () async {
                                                setState(() {
                                                  widget.selectedId =
                                                      "${document["userId"]}";
                                                });
                                                Navigator.of(context)
                                                    .pop(); // this will close the dialog box

                                                //if the request is cash in this dialog box will show
                                                if (requestType == "cash in") {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Container(
                                                          height: 50,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                              5,
                                                            )),
                                                            shadows: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x21000000),
                                                                blurRadius: 10,
                                                                offset: Offset(
                                                                    3, 2),
                                                                spreadRadius: 0,
                                                              )
                                                            ],
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Transaction Details',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                letterSpacing:
                                                                    0.50,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              //row for transaction date
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Date : ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    dateFinal,
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              //row for type of transaction just calling the request from the db
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Type of transaction : ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${document["request"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),

                                                              //row for user uid
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "User ID: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${document["userId"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for first and last name
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Name: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["firstname"]} " +
                                                                          "${document["lastname"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for mobile number
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Mobile Number: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["contactnum"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for address
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Address: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["address"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for amount
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Amount: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["amount"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              //the profile photo for the cash in
                                                              Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Proof of payment:",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 190,
                                                                    height: 270,
                                                                    decoration:
                                                                        ShapeDecoration(
                                                                      gradient:
                                                                          const LinearGradient(
                                                                        begin: Alignment(
                                                                            0.00,
                                                                            -1.00),
                                                                        end: Alignment(
                                                                            0,
                                                                            1),
                                                                        colors: [
                                                                          Color(
                                                                              0xFF27CB7D),
                                                                          Color(
                                                                              0xFF4EE48A)
                                                                        ],
                                                                      ),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(16),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      imageUrl:
                                                                          data[
                                                                              "proofPhoto"],
                                                                      width:
                                                                          230,
                                                                      height:
                                                                          300,
                                                                      placeholder:
                                                                          (context, url) =>
                                                                              const CircularProgressIndicator(),
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          const Icon(
                                                                              Icons.error),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      "Cash In Amount: ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  WalletTextField(
                                                                    controller:
                                                                        amountController,
                                                                    enabled:
                                                                        true,
                                                                    label: Text(
                                                                        "${document["amount"]}"),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: const Text(
                                                                "Add Balance"),
                                                            onPressed:
                                                                () async {
                                                              /**
                                                            * In this function when the button is clicked it will update the selected id
                                                            * the balance and the status then it will also create admin logs
                                                            */

                                                              await wallet.updateBalance(
                                                                  amountController
                                                                      .text,
                                                                  widget
                                                                      .selectedId);
                                                              await wallet
                                                                  .updateStatus(
                                                                      "Approved",
                                                                      widget
                                                                          .selectedId);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the AlertDialog Close

                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          "Succesful!"),
                                                                      content: Text(
                                                                          "Successfully added balance to ${document["firstname"]} ${document["lastname"]}"),
                                                                      actions: <Widget>[
                                                                        TextButton(
                                                                          child:
                                                                              const Text("Ok"),
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.of(context).pop(); // Close the AlertDialog

                                                                            Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text(
                                                                "Decline Request"),
                                                            onPressed:
                                                                () async {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      title: const Text(
                                                                          "Confirmation!"),
                                                                      content: Text(
                                                                          "Are you sure you want to decline ${data["request"]}  request of ${data["firstname"]} ${data["lastname"]}?  \n Click Proceed to decline successfully."),
                                                                      actions: <Widget>[
                                                                        TextButton(
                                                                          child:
                                                                              const Text("Proceed"),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              widget.selectedId = "${document["userId"]}";
                                                                            });
                                                                            String
                                                                                requestType =
                                                                                document["request"];
                                                                            if (requestType ==
                                                                                "cash in") {
                                                                              await wallet.updateStatus("DECLINED", widget.selectedId);
                                                                            } else if (requestType ==
                                                                                "cash out") {
                                                                              await wallet.updateStatus1("DECLINED", widget.selectedId);
                                                                            }
                                                                            Navigator.of(context).pop(); // Close the AlertDialog Close

                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return AlertDialog(
                                                                                    title: const Text("Succesful!"),
                                                                                    content: Text("Successfully declined ${data["request"]} request of ${data["firstname"]} ${data["lastname"]}."),
                                                                                    actions: <Widget>[
                                                                                      TextButton(
                                                                                        child: const Text("Ok"),
                                                                                        onPressed: () async {
                                                                                          Navigator.of(context).pop(); // Close the AlertDialog

                                                                                          Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                });
                                                                          },
                                                                        ),
                                                                        TextButton(
                                                                          child:
                                                                              const Text("Close"),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop(); // Close the  AlertDialog
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  });
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text(
                                                                "Close"),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the  AlertDialog
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                                //else if the request is cash out this dialog box will show
                                                else if (requestType ==
                                                    "cash out") {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Container(
                                                          height: 50,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                              5,
                                                            )),
                                                            shadows: const [
                                                              BoxShadow(
                                                                color: Color(
                                                                    0x21000000),
                                                                blurRadius: 10,
                                                                offset: Offset(
                                                                    3, 2),
                                                                spreadRadius: 0,
                                                              )
                                                            ],
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Transaction Details',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                letterSpacing:
                                                                    0.50,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              //row for transaction date
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Date : ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    dateFinal,
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              //row for type of transaction just calling the request from the db
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Type of transaction : ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${document["request"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),

                                                              //row for user uid
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "User ID: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${document["userId"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for first and last name
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Name: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["firstname"]} " +
                                                                          "${document["lastname"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for mobile number
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Mobile Number: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["contactnum"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for address
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Address: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["address"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 2,
                                                              ),
                                                              //row for amount
                                                              Row(
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    "Cash out amount: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      "${document["amount"]} ",
                                                                      style: Poppins
                                                                          .adminName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09041B),
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              ElevatedButton
                                                                  .icon(
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    widget.selectedId =
                                                                        "${document["userId"]}";
                                                                  });
                                                                  await selectImage();
                                                                  await uploadImage(
                                                                      widget
                                                                          .selectedId);
                                                                  // Close the first dialog
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();

                                                                  //this dialog will show the selected image
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("Confirmation"),
                                                                          content:
                                                                              Column(
                                                                            children: [
                                                                              const Text(
                                                                                "Please click confirm to successfully accept users cash out!",
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 20,
                                                                              ),

                                                                              const Text("Proof of Payment!"),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              //this will preview the selected image
                                                                              Container(
                                                                                child: _selectedImage != null
                                                                                    ? Container(
                                                                                        width: 200, // Set your desired width
                                                                                        height: 200, // Set your desired height
                                                                                        decoration: BoxDecoration(
                                                                                          image: DecorationImage(
                                                                                            image: MemoryImage(_selectedImage!),
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : const Text("No image selected"),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                              child: const Text("Confirm"),
                                                                              onPressed: () async {
                                                                                setState(() {
                                                                                  widget.selectedId = "${document["userId"]}";
                                                                                });
                                                                                String cashOutAmount = "${document["amount"]} ";
                                                                                //this will decrement the balance of the user
                                                                                await wallet.updateBalance1(cashOutAmount, widget.selectedId);
                                                                                await wallet.updateStatus1("Approved", widget.selectedId);
                                                                                Navigator.of(context).pop(); // Close the  AlertDialog

                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text("Success"),
                                                                                      content: Text("Sucessfully confirm ${document["firstname"]} ${document["lastname"]} cash out!"),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () {
                                                                                            Navigator.of(context).pop();
                                                                                            Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                                          },
                                                                                          child: const Text("Close"),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                                Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                              },
                                                                              child: const Text("Cancel"),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .upload),
                                                                label:
                                                                    const Text(
                                                                  "Click to upload receipt",
                                                                ),
                                                              ),

                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Text(
                                      'Review Request',
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 10,
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
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    /* else will check if the search bar is empty this will show*/
    else {
      return ListTile(
        title: GestureDetector(
          child: Container(
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
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          //this padding holds the profile image of the farmer
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: //this will display the users profile picture in each listtile
                                CachedNetworkImage(
                              imageUrl: data["profilePhoto"] ??
                                  "", // Provide a default empty string if it's null
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: 20,
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error);
                              },
                            ),
                          ),

                          //this column holds the admin users info
                          //like firstname, lastname and address
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //first column that holds the admin user firstname and username
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "${data["firstname"]} ",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "${data["lastname"]}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //second column that holds the admin user address
                              Text(
                                "${data["address"]}",
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          const Text(
                            "Request : ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${data["request"]}",
                            style: Poppins.contentText.copyWith(
                              color: const Color(0xFF09041B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),

                    //sizedbox for reviewing request button of farmer wallet request
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                  Radius.circular(10),
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
                                onPressed: () async {
                                  setState(() {
                                    widget.selectedId = "${document["userId"]}";
                                  });

                                  String requestType = document["request"];

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Note!"),
                                        content: Text(
                                            "This account is requesting for ${document["request"]}"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () async {
                                              setState(() {
                                                widget.selectedId =
                                                    "${document["userId"]}";
                                              });
                                              Navigator.of(context)
                                                  .pop(); // this will close the dialog box

                                              //if the request is cash in this dialog box will show
                                              if (requestType == "cash in") {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Container(
                                                        height: 50,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                            5,
                                                          )),
                                                          shadows: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x21000000),
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(3, 2),
                                                              spreadRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Transaction Details',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              letterSpacing:
                                                                  0.50,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            //row for transaction date
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Date : ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateFinal,
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            //row for type of transaction just calling the request from the db
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Type of transaction : ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${document["request"]} ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),

                                                            //row for user uid
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "User ID: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${document["userId"]} ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for first and last name
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Name: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["firstname"]} " +
                                                                        "${document["lastname"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for mobile number
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Mobile Number: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["contactnum"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for address
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Address: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["address"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for amount
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Amount: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["amount"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            //the proof photo for the cash in
                                                            Column(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Proof of payment:",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 190,
                                                                  height: 270,
                                                                  decoration:
                                                                      ShapeDecoration(
                                                                    gradient:
                                                                        const LinearGradient(
                                                                      begin: Alignment(
                                                                          0.00,
                                                                          -1.00),
                                                                      end: Alignment(
                                                                          0, 1),
                                                                      colors: [
                                                                        Color(
                                                                            0xFF27CB7D),
                                                                        Color(
                                                                            0xFF4EE48A)
                                                                      ],
                                                                    ),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: data[
                                                                        "proofPhoto"],
                                                                    width: 230,
                                                                    height: 300,
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            const CircularProgressIndicator(),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        const Icon(
                                                                            Icons.error),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    "Cash In Amount: ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                WalletTextField(
                                                                  controller:
                                                                      amountController,
                                                                  enabled: true,
                                                                  label: Text(
                                                                      "${document["amount"]}"),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: const Text(
                                                              "Add Balance"),
                                                          onPressed: () async {
                                                            /**
                                                            * In this function when the button is clicked it will update the selected id
                                                            * the balance and the status then it will also create admin logs
                                                            */

                                                            await wallet.updateBalance(
                                                                amountController
                                                                    .text,
                                                                widget
                                                                    .selectedId);
                                                            await wallet
                                                                .updateStatus(
                                                                    "Approved",
                                                                    widget
                                                                        .selectedId);
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the AlertDialog Close

                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        "Succesful!"),
                                                                    content: Text(
                                                                        "Successfully added balance to ${document["firstname"]} ${document["lastname"]}"),
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            "Ok"),
                                                                        onPressed:
                                                                            () async {
                                                                          Navigator.of(context)
                                                                              .pop(); // Close the AlertDialog

                                                                          Navigator.of(context)
                                                                              .pushNamed(RoutesManager.requestwalletpage);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: const Text(
                                                              "Decline Request"),
                                                          onPressed: () async {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        "Confirmation!"),
                                                                    content: Text(
                                                                        "Are you sure you want to decline ${data["request"]}  request of ${data["firstname"]} ${data["lastname"]}?  \n Click Proceed to decline successfully."),
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            "Proceed"),
                                                                        onPressed:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            widget.selectedId =
                                                                                "${document["userId"]}";
                                                                          });
                                                                          String
                                                                              requestType =
                                                                              document["request"];
                                                                          if (requestType ==
                                                                              "cash in") {
                                                                            await wallet.updateStatus("DECLINED",
                                                                                widget.selectedId);
                                                                          } else if (requestType ==
                                                                              "cash out") {
                                                                            await wallet.updateStatus1("DECLINED",
                                                                                widget.selectedId);
                                                                          }
                                                                          Navigator.of(context)
                                                                              .pop(); // Close the AlertDialog Close

                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return AlertDialog(
                                                                                  title: const Text("Succesful!"),
                                                                                  content: Text("Successfully declined ${data["request"]} request of ${data["firstname"]} ${data["lastname"]}."),
                                                                                  actions: <Widget>[
                                                                                    TextButton(
                                                                                      child: const Text("Ok"),
                                                                                      onPressed: () async {
                                                                                        Navigator.of(context).pop(); // Close the AlertDialog

                                                                                        Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              });
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        child: const Text(
                                                                            "Close"),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop(); // Close the  AlertDialog
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: const Text(
                                                              "Close"),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the  AlertDialog
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                              //else if the request is cash out this dialog box will show
                                              else if (requestType ==
                                                  "cash out") {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Container(
                                                        height: 50,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                            5,
                                                          )),
                                                          shadows: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x21000000),
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(3, 2),
                                                              spreadRadius: 0,
                                                            )
                                                          ],
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            'Transaction Details',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              letterSpacing:
                                                                  0.50,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            //row for transaction date
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Date : ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateFinal,
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            //row for type of transaction just calling the request from the db
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Type of transaction : ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${document["request"]} ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),

                                                            //row for user uid
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "User ID: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "${document["userId"]} ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for first and last name
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Name: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["firstname"]} " +
                                                                        "${document["lastname"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for mobile number
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Mobile Number: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["contactnum"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for address
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Address: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["address"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 2,
                                                            ),
                                                            //row for amount
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  "Cash out amount: ",
                                                                  style: Poppins
                                                                      .adminName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09041B),
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    "${document["amount"]} ",
                                                                    style: Poppins
                                                                        .adminName
                                                                        .copyWith(
                                                                      color: const Color(
                                                                          0xFF09041B),
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            ElevatedButton.icon(
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  widget.selectedId =
                                                                      "${document["userId"]}";
                                                                });
                                                                await selectImage();
                                                                await uploadImage(
                                                                    widget
                                                                        .selectedId);
                                                                // Close the first dialog
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();

                                                                //this dialog will show the selected image
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Confirmation"),
                                                                        content:
                                                                            Column(
                                                                          children: [
                                                                            const Text(
                                                                              "Please click confirm to successfully accept users cash out!",
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 20,
                                                                            ),

                                                                            const Text("Proof of Payment!"),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            //this will preview the selected image
                                                                            Container(
                                                                              child: _selectedImage != null
                                                                                  ? Container(
                                                                                      width: 200, // Set your desired width
                                                                                      height: 200, // Set your desired height
                                                                                      decoration: BoxDecoration(
                                                                                        image: DecorationImage(
                                                                                          image: MemoryImage(_selectedImage!),
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  : const Text("No image selected"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        actions: [
                                                                          TextButton(
                                                                            child:
                                                                                const Text("Confirm"),
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                widget.selectedId = "${document["userId"]}";
                                                                              });
                                                                              String cashOutAmount = "${document["amount"]} ";
                                                                              //this will decrement the balance of the user
                                                                              await wallet.updateBalance1(cashOutAmount, widget.selectedId);
                                                                              await wallet.updateStatus1("Approved", widget.selectedId);
                                                                              Navigator.of(context).pop(); // Close the  AlertDialog

                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return AlertDialog(
                                                                                    title: const Text("Success"),
                                                                                    content: Text("Sucessfully confirm ${document["firstname"]} ${document["lastname"]} cash out!"),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                                          Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                                        },
                                                                                        child: const Text("Close"),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                          TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pushNamed(RoutesManager.requestwalletpage);
                                                                            },
                                                                            child:
                                                                                const Text("Cancel"),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                              icon: const Icon(
                                                                  Icons.upload),
                                                              label: const Text(
                                                                "Click to upload receipt",
                                                              ),
                                                            ),

                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'Review Request',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 10,
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
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }

  // Variable to store the selected image data.
  Uint8List? _selectedImage;
  String? imageUrl;

  //a function to select image
  Future<void> selectImage() async {
    try {
      final FileUploadInputElement input = FileUploadInputElement();
      input.accept = "image/*";
      input.click();

      /*This is for da  purpose of displaying the image after it was selected */
      final completer = Completer<Uint8List>();
      /*This is for da saving the image as a string into the databae */
      //final completer2 = Completer<String>();

      input.onChange.listen((event) {
        final file = input.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          final dataUrl = reader.result as String;
          //completer2.complete(reader.result as String);
          final base64String = dataUrl.split(',').last;
          completer.complete(Uint8List.fromList(base64Decode(base64String)));
        });
        reader.readAsDataUrl(file);
      });

      /*variable to be ued for da Uint8 for da display of image here */
      final selectedImage = await completer.future;
      /*variable to be used for da String that will use to save String url to database */
      //final myImageUrl = await completer2.future;

      // Store the selected image data.
      setState(() {
        _selectedImage = selectedImage;
        //imageUrl = myImageUrl;
      });
    } catch (e) {
      print("Profile image has not uploaded successfully");
    }
  }

  //a function to upload the image
  Future<void> uploadImage(String userId) async {
    try {
      if (_selectedImage == null) {
        // Handle the case where no image is selected.
        return;
      }

      // Initialize Firebase Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference collection =
          firestore.collection('sample_FarmerWallet');

      RetriveWalletDocId retrieve = RetriveWalletDocId();
      String mydocid = await retrieve.getDocIdRequestCashOut(userId);

      // Generate a unique filename
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final fileName = 'images/$timestamp.jpg';

      // Upload the image to Firebase Storage
      final storage = FirebaseStorage.instance;
      final Reference storageReference = storage.ref().child(fileName);

      try {
        // Upload the image
        final UploadTask uploadTask = storageReference.putData(_selectedImage!);
        final TaskSnapshot taskSnapshot = await uploadTask;
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Define the data to be added to the Firestore document
        final Map<String, dynamic> data = {
          'proofPhoto': downloadUrl,
        };

        // Update the 'ProfileUrl' field in the Firestore document
        await collection.doc(mydocid).update(data);

        print(
            'Profile image URL has been updated in the Firestore document with ID: $mydocid');
      } catch (e) {
        print("Profile image has not uploaded successfully: $e");
      }
    } catch (e) {
      print("Upload Image Failed!");
    }
  }
}
