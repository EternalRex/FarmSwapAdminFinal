import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/farmer_wallet_management_balance/widget/wallet_consumer_retrieveDocId.dart';
import 'package:farm_swap_admin/clare_modules/pages/farmer_wallet_management_balance/widget/wallet_textfield.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/admin_requests_reactivation/widget/third_expanded_textbuttons.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_chat_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_notification_btn.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../rollaine_modules/pages/user_page/widgets/Text/title_text.dart';

// ignore: must_be_immutable
class RequestBalanceConsumerList extends StatefulWidget {
  RequestBalanceConsumerList({super.key, this.documentId});

  final String? documentId;
  String selectedId = '';
  String cashOutselectedId = "";

  @override
  State<RequestBalanceConsumerList> createState() =>
      _RequestBalanceConsumerListState();
}

class _RequestBalanceConsumerListState
    extends State<RequestBalanceConsumerList> {
  final GetAllAdminRequests getAllAdminRequests = GetAllAdminRequests();

  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  TextEditingController searchController = TextEditingController();

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
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
                //this calls the dashboard buttons nga naa tanan side menu button
                child: const DashBoardExpanded1Item(),
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
                  //Design the page title
                  title: const TitleText(
                    myText: 'Consumer Wallet',
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
                body: Row(
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
                                        left: 15, bottom: 10),
                                    child: Container(
                                      width: 780,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, top: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Consumer Requests',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: SizedBox(
                                  height: 385,
                                  child: _buildConsumerList(),
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
                      height: 180,
                    ),

                    //Platform icon and label
                    FarmerRequestsListBtn(),
                    SizedBox(
                      height: 30,
                    ),

                    //Barter icon and label
                    ConsumerRequestsListBtn(),
                    SizedBox(
                      height: 15,
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

  //this will show the collection that has a status equal to pending
  Widget _buildConsumerList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_ConsumerWallet')
          .where('status', whereIn: ['PENDING']).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Displaying a loading indicator while waiting for data.
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Color(0xFF15be77),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: snapshot.data!.docs.map<Widget>((document) {
                return _buildConsumerListItems(document);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildConsumerListItems(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    final profilePhoto = CachedNetworkImageProvider("${data["profilePhoto"]}");
    TextEditingController amountController = TextEditingController();
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateFinal = DateFormat('MM/dd/yyyy').format(dateTime);

    UpdateConsumerWallet wallet = UpdateConsumerWallet();

    if (searchValue.isNotEmpty) {
      if (data["firstname"] == searchValue ||
          data["lastname"] == searchValue ||
          data["request"] == searchValue) {
        return ListTile(
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
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: profilePhoto,
                              radius: 20,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //first column that holds the admin user firstname and username
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "${data["firstname"]} ",
                                      style: Poppins.userName.copyWith(
                                        color: const Color(0xFF09041B),
                                      ),
                                    ),
                                    Text(
                                      "${data["lastname"]}",
                                      style: Poppins.userName.copyWith(
                                        color: const Color(0xFF09041B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //second column that holds the admin user address
                              Text(
                                "${data["address"]}",
                                style: Poppins.detailsText.copyWith(
                                  color: const Color(0xFF09041B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(
                            "Request: ",
                            style: Poppins.detailsText.copyWith(
                              color: const Color(0xFF09041B),
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
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          //sizedbox for accept button of admin reactivation
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
                                        Radius.circular(17.50),
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        disabledForegroundColor: Colors
                                            .transparent
                                            .withOpacity(0.38),
                                        disabledBackgroundColor: Colors
                                            .transparent
                                            .withOpacity(0.12),
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          widget.selectedId =
                                              "${document["userId"]}";
                                        });

                                        String requestType =
                                            document["request"];

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
                                                    if (requestType ==
                                                        "Cash In") {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Container(
                                                              height: 50,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                  5,
                                                                )),
                                                                shadows: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x21000000),
                                                                    blurRadius:
                                                                        10,
                                                                    offset:
                                                                        Offset(
                                                                            3,
                                                                            2),
                                                                    spreadRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Transaction Details',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        20,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Date : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateFinal,
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Type of transaction : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["request"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "User ID: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["userId"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Name: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["firstname"]} " +
                                                                              "${document["lastname"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Mobile Number: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["contactnum"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Address: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["address"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Amount: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["amount"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Proof of payment:",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            190,
                                                                        height:
                                                                            270,
                                                                        decoration:
                                                                            ShapeDecoration(
                                                                          gradient:
                                                                              const LinearGradient(
                                                                            begin:
                                                                                Alignment(0.00, -1.00),
                                                                            end:
                                                                                Alignment(0, 1),
                                                                            colors: [
                                                                              Color(0xFF27CB7D),
                                                                              Color(0xFF4EE48A)
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
                                                                              data["proofPhoto"],
                                                                          width:
                                                                              230,
                                                                          height:
                                                                              300,
                                                                          placeholder: (context, url) =>
                                                                              const CircularProgressIndicator(),
                                                                          errorWidget: (context, url, error) =>
                                                                              const Icon(Icons.error),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          "Cash In Amount: ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                  await wallet.updateStatus(
                                                                      "APPROVED",
                                                                      widget
                                                                          .selectedId);
                                                                  // ignore: use_build_context_synchronously
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the AlertDialog Close

                                                                  // ignore: use_build_context_synchronously
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("Succesful!"),
                                                                          content:
                                                                              Text("Successfully added balance to ${document["firstname"]} ${document["lastname"]}"),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: const Text("Ok"),
                                                                              onPressed: () async {
                                                                                Navigator.of(context).pop(); // Close the AlertDialog

                                                                                Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: const Text(
                                                                    "Cancel"),
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
                                                        "Cash Out") {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Container(
                                                              height: 50,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                  5,
                                                                )),
                                                                shadows: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x21000000),
                                                                    blurRadius:
                                                                        10,
                                                                    offset:
                                                                        Offset(
                                                                            3,
                                                                            2),
                                                                    spreadRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Transaction Details',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        20,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Date : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateFinal,
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Type of transaction : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["request"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "User ID: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["userId"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Name: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["firstname"]} " +
                                                                              "${document["lastname"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Mobile Number: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["contactnum"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Address: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["address"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Cash out amount: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["amount"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: const Text(
                                                                    "Proceed"),
                                                                onPressed:
                                                                    () async {
                                                                  String
                                                                      cashOutAmount =
                                                                      "${document["amount"]}";
                                                                  //this will decrement the balance of the user
                                                                  await wallet.updateBalance1(
                                                                      cashOutAmount,
                                                                      widget
                                                                          .selectedId);
                                                                  await wallet.updateStatus1(
                                                                      'APPROVED',
                                                                      widget
                                                                          .selectedId);

                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the AlertDialog Close

                                                                  //for the mean time kani lang sa na dialog
                                                                  // ignore: use_build_context_synchronously
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("Confirmation!"),
                                                                          content:
                                                                              Text("Do you want to approve request cash out of ${document["firstname"]} ${document["lastname"]} ?"),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: const Text("Yes"),
                                                                              onPressed: () async {
                                                                                Navigator.of(context).pop(); // Close the AlertDialog

                                                                                //diri na part sad dapat naa ang pag upload sa proof of payment ni admin
                                                                                //update sa proofPhoto
                                                                                /**update ang balance with the amount minus balance */
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return AlertDialog(
                                                                                        title: const Text("Successful!"),
                                                                                        content: Text("Successfully approve request cash out of ${document["firstname"]} ${document["lastname"]}"),
                                                                                        actions: <Widget>[
                                                                                          TextButton(
                                                                                            child: const Text("Ok"),
                                                                                            onPressed: () async {
                                                                                              Navigator.of(context).pop(); // Close the AlertDialog

                                                                                              Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    });
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: const Text(
                                                                    "Cancel"),
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
                                          'Accept',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 8,
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

                          //sizedbox for decline button of admin reactivation
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //decline button
                                  DecoratedBox(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFf4a61c),
                                          Color(0xFFff4b4b),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(17.50),
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        disabledForegroundColor: Colors
                                            .transparent
                                            .withOpacity(0.38),
                                        disabledBackgroundColor: Colors
                                            .transparent
                                            .withOpacity(0.12),
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          widget.selectedId =
                                              "${document["userId"]}";
                                        });

                                        String requestType =
                                            document["request"];

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text("Note!"),
                                              content: const Text(
                                                  "You are about to decline this account."),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text(
                                                      "Review Request"),
                                                  onPressed: () async {
                                                    Navigator.of(context)
                                                        .pop(); // this will close the dialog box

                                                    //if the request is cash in this dialog box will show
                                                    if (requestType ==
                                                        "Cash In") {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Container(
                                                              height: 50,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                  5,
                                                                )),
                                                                shadows: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x21000000),
                                                                    blurRadius:
                                                                        10,
                                                                    offset:
                                                                        Offset(
                                                                            3,
                                                                            2),
                                                                    spreadRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Transaction Details',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        20,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Date : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateFinal,
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Type of transaction : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["request"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "User ID: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["userId"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Name: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["firstname"]} " +
                                                                              "${document["lastname"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Mobile Number: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["contactnum"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Address: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["address"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Amount: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["amount"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Proof of payment:",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            190,
                                                                        height:
                                                                            270,
                                                                        decoration:
                                                                            ShapeDecoration(
                                                                          gradient:
                                                                              const LinearGradient(
                                                                            begin:
                                                                                Alignment(0.00, -1.00),
                                                                            end:
                                                                                Alignment(0, 1),
                                                                            colors: [
                                                                              Color(0xFF27CB7D),
                                                                              Color(0xFF4EE48A)
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
                                                                              data["proofPhoto"],
                                                                          width:
                                                                              230,
                                                                          height:
                                                                              300,
                                                                          placeholder: (context, url) =>
                                                                              const CircularProgressIndicator(),
                                                                          errorWidget: (context, url, error) =>
                                                                              const Icon(Icons.error),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: const Text(
                                                                    "Decline Request"),
                                                                onPressed:
                                                                    () async {
                                                                  await wallet.updateStatus(
                                                                      "DECLINED",
                                                                      widget
                                                                          .selectedId);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the AlertDialog Close

                                                                  // ignore: use_build_context_synchronously
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("Succesful!"),
                                                                          content:
                                                                              Text("Successfully decline cash in request of ${document["firstname"]} ${document["lastname"]}"),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: const Text("Ok"),
                                                                              onPressed: () async {
                                                                                Navigator.of(context).pop(); // Close the AlertDialog

                                                                                Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                              ),
                                                              TextButton(
                                                                child:
                                                                    const Text(
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
                                                        "Cash Out") {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Container(
                                                              height: 50,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                  5,
                                                                )),
                                                                shadows: const [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x21000000),
                                                                    blurRadius:
                                                                        10,
                                                                    offset:
                                                                        Offset(
                                                                            3,
                                                                            2),
                                                                    spreadRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Transaction Details',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .green,
                                                                    fontSize:
                                                                        20,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Date : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateFinal,
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Type of transaction : ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["request"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "User ID: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "${document["userId"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.normal,
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Name: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["firstname"]} " +
                                                                              "${document["lastname"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Mobile Number: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["contactnum"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Address: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["address"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Cash out amount: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          "${document["amount"]} ",
                                                                          style: Poppins
                                                                              .adminName
                                                                              .copyWith(
                                                                            color:
                                                                                const Color(0xFF09041B),
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
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: const Text(
                                                                    "Decline Request"),
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(); // Close the AlertDialog Close
                                                                  await wallet.updateStatus1(
                                                                      "DECLINED",
                                                                      widget
                                                                          .selectedId);

                                                                  // ignore: use_build_context_synchronously
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text("Successful!"),
                                                                          content:
                                                                              Text("Successfully decline request cash out of ${document["firstname"]} ${document["lastname"]}"),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              child: const Text("Ok"),
                                                                              onPressed: () async {
                                                                                Navigator.of(context).pop(); // Close the AlertDialog
                                                                                Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      });
                                                                },
                                                              ),
                                                              TextButton(
                                                                child:
                                                                    const Text(
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
                                          'Decline',
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 8,
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    } else {
      return ListTile(
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
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: profilePhoto,
                            radius: 20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first column that holds the admin user firstname and username
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "${data["firstname"]} ",
                                    style: Poppins.userName.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                  Text(
                                    "${data["lastname"]}",
                                    style: Poppins.userName.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //second column that holds the admin user address
                            Text(
                              "${data["address"]}",
                              style: Poppins.detailsText.copyWith(
                                color: const Color(0xFF09041B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Text(
                          "Request: ",
                          style: Poppins.detailsText.copyWith(
                            color: const Color(0xFF09041B),
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
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        //sizedbox for accept button of admin reactivation
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
                                      Radius.circular(17.50),
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
                                                  Navigator.of(context)
                                                      .pop(); // this will close the dialog box

                                                  //if the request is cash in this dialog box will show
                                                  if (requestType ==
                                                      "Cash In") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Container(
                                                            height: 50,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  Colors.white,
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
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      Offset(
                                                                          3, 2),
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ],
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Transaction Details',
                                                                style:
                                                                    TextStyle(
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["firstname"]} " +
                                                                            "${document["lastname"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["contactnum"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["address"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["amount"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          190,
                                                                      height:
                                                                          270,
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
                                                                            Color(0xFF27CB7D),
                                                                            Color(0xFF4EE48A)
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
                                                                            data["proofPhoto"],
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
                                                                            const Icon(Icons.error),
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
                                                                      child:
                                                                          Text(
                                                                        "Cash In Amount: ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                        "APPROVED",
                                                                        widget
                                                                            .selectedId);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the AlertDialog Close

                                                                // ignore: use_build_context_synchronously
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Succesful!"),
                                                                        content:
                                                                            Text("Successfully added balance to ${document["firstname"]} ${document["lastname"]}"),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text("Ok"),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context).pop(); // Close the AlertDialog

                                                                              Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                  "Cancel"),
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
                                                      "Cash Out") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Container(
                                                            height: 50,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  Colors.white,
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
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      Offset(
                                                                          3, 2),
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ],
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Transaction Details',
                                                                style:
                                                                    TextStyle(
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["firstname"]} " +
                                                                            "${document["lastname"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["contactnum"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["address"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["amount"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  "Proceed"),
                                                              onPressed:
                                                                  () async {
                                                                //await updateBalanceCashOut(
                                                                //  newBalance,
                                                                //widget.selectedId);

                                                                String
                                                                    cashOutAmount =
                                                                    "${document["amount"]}";
                                                                //this will decrement the balance of the user
                                                                await wallet.updateBalance1(
                                                                    cashOutAmount,
                                                                    widget
                                                                        .selectedId);
                                                                await wallet
                                                                    .updateStatus1(
                                                                        'APPROVED',
                                                                        widget
                                                                            .selectedId);

                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the AlertDialog Close

                                                                //for the mean time kani lang sa na dialog
                                                                // ignore: use_build_context_synchronously
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Confirmation!"),
                                                                        content:
                                                                            Text("Do you want to approve request cash out of ${document["firstname"]} ${document["lastname"]} ?"),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text("Yes"),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context).pop(); // Close the AlertDialog

                                                                              //diri na part sad dapat naa ang pag upload sa proof of payment ni admin
                                                                              //update sa proofPhoto
                                                                              /**update ang balance with the amount minus balance */
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text("Successful!"),
                                                                                      content: Text("Successfully approve request cash out of ${document["firstname"]} ${document["lastname"]}"),
                                                                                      actions: <Widget>[
                                                                                        TextButton(
                                                                                          child: const Text("Ok"),
                                                                                          onPressed: () async {
                                                                                            Navigator.of(context).pop(); // Close the AlertDialog

                                                                                            Navigator.of(context).pushNamed(RoutesManager.walletPage);
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                  "Cancel"),
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
                                        'Accept',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 8,
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

                        //sizedbox for decline button of admin reactivation
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //decline button
                                DecoratedBox(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFf4a61c),
                                        Color(0xFFff4b4b),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(17.50),
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
                                            content: const Text(
                                                "You are about to decline this account."),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                    "Review Request"),
                                                onPressed: () async {
                                                  Navigator.of(context)
                                                      .pop(); // this will close the dialog box

                                                  //if the request is cash in this dialog box will show
                                                  if (requestType ==
                                                      "Cash In") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Container(
                                                            height: 50,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  Colors.white,
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
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      Offset(
                                                                          3, 2),
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ],
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Transaction Details',
                                                                style:
                                                                    TextStyle(
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["firstname"]} " +
                                                                            "${document["lastname"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["contactnum"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["address"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["amount"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          190,
                                                                      height:
                                                                          270,
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
                                                                            Color(0xFF27CB7D),
                                                                            Color(0xFF4EE48A)
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
                                                                            data["proofPhoto"],
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
                                                                            const Icon(Icons.error),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  "Decline Request"),
                                                              onPressed:
                                                                  () async {
                                                                await wallet
                                                                    .updateStatus(
                                                                        "DECLINED",
                                                                        widget
                                                                            .selectedId);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the AlertDialog Close

                                                                // ignore: use_build_context_synchronously
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Succesful!"),
                                                                        content:
                                                                            Text("Successfully decline cash in request of ${document["firstname"]} ${document["lastname"]}"),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text("Ok"),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context).pop(); // Close the AlertDialog

                                                                              Navigator.of(context).pushNamed(RoutesManager.walletPage);
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
                                                      "Cash Out") {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Container(
                                                            height: 50,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color:
                                                                  Colors.white,
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
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      Offset(
                                                                          3, 2),
                                                                  spreadRadius:
                                                                      0,
                                                                )
                                                              ],
                                                            ),
                                                            child: const Center(
                                                              child: Text(
                                                                'Transaction Details',
                                                                style:
                                                                    TextStyle(
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
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
                                                                            FontWeight.normal,
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["firstname"]} " +
                                                                            "${document["lastname"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["contactnum"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["address"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "${document["amount"]} ",
                                                                        style: Poppins
                                                                            .adminName
                                                                            .copyWith(
                                                                          color:
                                                                              const Color(0xFF09041B),
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
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  "Decline Request"),
                                                              onPressed:
                                                                  () async {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Close the AlertDialog Close
                                                                await wallet
                                                                    .updateStatus1(
                                                                        "DECLINED",
                                                                        widget
                                                                            .selectedId);

                                                                // ignore: use_build_context_synchronously
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Successful!"),
                                                                        content:
                                                                            Text("Successfully decline request cash out of ${document["firstname"]} ${document["lastname"]}"),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            child:
                                                                                const Text("Ok"),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.of(context).pop(); // Close the AlertDialog
                                                                              Navigator.of(context).pushNamed(RoutesManager.walletPage);
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
                                        'Decline',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 8,
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
