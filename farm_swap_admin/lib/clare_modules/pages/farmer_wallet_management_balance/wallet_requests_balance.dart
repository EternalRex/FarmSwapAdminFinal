// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:farm_swap_admin/routes/routes.dart';
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
                    myText: "Farmer Wallet Requests",
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
                            hintText: 'Search here',
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchValue = searchController.text;
                                });
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xFFDA6317),
                              ),
                            ),
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
                    const FarmerRequestsListBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ConsumerRequestsListBtn(),
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
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: snapshot.data!.docs.map<Widget>((document) {
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
    final profileImage = CachedNetworkImageProvider("${data["profilePhoto"]}");
    TextEditingController amountController = TextEditingController();
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateFinal = DateFormat('yyyy-MM-dd').format(dateTime);

    UpdateWallet wallet = UpdateWallet();
/*Only the specific account searched will display*/
    if (searchValue.isNotEmpty) {
      if (data["firstname"] == searchValue ||
          data["lastname"] == searchValue ||
          data["request"] == searchValue) {
        return ListTile();
      }
    }

    /* else will check if the search bar is empty this will show*/
    else {
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
                        //this padding holds the profile image of the admin
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: profileImage,
                            radius: 20,
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
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),

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
                                  Color(0xEEFF9012),
                                  Color.fromARGB(255, 233, 104, 39),
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
                                                            color: Colors.green,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            letterSpacing: 0.50,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 10,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                    end:
                                                                        Alignment(
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
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      const CircularProgressIndicator(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(
                                                                          Icons
                                                                              .error),
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
                                                          Navigator.of(context)
                                                              .pop(); // Close the AlertDialog Close

                                                          showDialog(
                                                              context: context,
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
                                                                            .pushNamed(RoutesManager.farmerrequestwalletpage);
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
                                                          Navigator.of(context)
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
                                                            color: Colors.green,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            letterSpacing: 0.50,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 10,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: const Text(
                                                            "Proceed"),
                                                        onPressed: () async {
                                                          String cashOutAmount =
                                                              "${document["amount"]} ";
                                                          //this will decrement the balance of the user
                                                          await wallet
                                                              .updateBalance1(
                                                                  cashOutAmount,
                                                                  widget
                                                                      .selectedId);
                                                          await wallet
                                                              .updateStatus1(
                                                                  "Approved",
                                                                  widget
                                                                      .selectedId);
                                                          Navigator.of(context)
                                                              .pop(); // Close the AlertDialog Close

                                                          //temporary dialog as of now
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      "Success"),
                                                                  content:
                                                                      const Text(
                                                                          "Successfully approved cash out!"),
                                                                  actions: [
                                                                    TextButton(
                                                                      child: const Text(
                                                                          "Ok"),
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator.of(context)
                                                                            .pop(); // Close the  AlertDialog
                                                                        Navigator.of(context)
                                                                            .pushNamed(RoutesManager.farmerrequestwalletpage);
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
                                                          Navigator.of(context)
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
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
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
                                  widget.selectedId = "${document["userId"]}";
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
                                          child: const Text("Review Request"),
                                          onPressed: () async {
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
                                                            color: Colors.green,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            letterSpacing: 0.50,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 10,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                    end:
                                                                        Alignment(
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
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      const CircularProgressIndicator(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(
                                                                          Icons
                                                                              .error),
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
                                                        onPressed: () async {
                                                          await wallet
                                                              .updateStatus(
                                                                  "Decline",
                                                                  widget
                                                                      .selectedId);
                                                          Navigator.of(context)
                                                              .pop(); // Close the AlertDialog Close

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      "Succesful!"),
                                                                  content: Text(
                                                                      "Successfully decline cash in request of ${document["firstname"]} ${document["lastname"]}"),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: const Text(
                                                                          "Ok"),
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator.of(context)
                                                                            .pop(); // Close the AlertDialog

                                                                        Navigator.of(context)
                                                                            .pushNamed(RoutesManager.farmerrequestwalletpage);
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
                                                        onPressed: () {
                                                          Navigator.of(context)
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
                                                            color: Colors.green,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            letterSpacing: 0.50,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 10,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                                  fontSize: 15,
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
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: const Text(
                                                            "Decline Request"),
                                                        onPressed: () async {
                                                          Navigator.of(context)
                                                              .pop(); // Close the AlertDialog Close
                                                          await wallet
                                                              .updateStatus1(
                                                                  "Decline",
                                                                  widget
                                                                      .selectedId);

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      "Successful!"),
                                                                  content: Text(
                                                                      "Successfully decline request cash out of ${document["firstname"]} ${document["lastname"]}"),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: const Text(
                                                                          "Ok"),
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator.of(context)
                                                                            .pop(); // Close the AlertDialog
                                                                        Navigator.of(context)
                                                                            .pushNamed(RoutesManager.farmerrequestwalletpage);
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
                                                        onPressed: () {
                                                          Navigator.of(context)
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
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
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
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
