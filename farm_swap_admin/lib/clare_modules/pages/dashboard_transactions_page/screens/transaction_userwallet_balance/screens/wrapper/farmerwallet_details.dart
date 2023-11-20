import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../../../../constants/Colors/colors_rollaine.dart';
import '../../../../../../../karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';

class SpecificWalletDetailsFarmer extends StatefulWidget {
  const SpecificWalletDetailsFarmer({
    super.key,
    this.documentID,
  });
  final String? documentID;

  @override
  State<SpecificWalletDetailsFarmer> createState() =>
      _SpecificWalletDetailsFarmerState();
}

TextEditingController searchController = TextEditingController();
String searchValue = "";

class _SpecificWalletDetailsFarmerState
    extends State<SpecificWalletDetailsFarmer> {
  @override
  Widget build(BuildContext context) {
    //creates a reference to our database firestore
    CollectionReference reference =
        FirebaseFirestore.instance.collection("sample_FarmerUsers");

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
                      Navigator.of(context)
                          .pushNamed(RoutesManager.adminTransactionsUserWallet);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Farmer Wallet History",
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
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xFFDA6317),
                              ),
                              onPressed: () {},
                            ),
                            prefixIconColor: const Color(0xFFDA6317),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              searchValue = searchController.text;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                body: Row(
                  children: [
                    //Expanded for main content
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                          height: 510,
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
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15,
                                        left: 15,
                                        right: 15,
                                        bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: greenLight,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: shadow,
                                              blurRadius: 2,
                                              offset: const Offset(0, 1),
                                            )
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            /*Farmers Title */
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Date and Time',
                                                textAlign: TextAlign.center,
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Request',
                                                textAlign: TextAlign.center,
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Amount',
                                                textAlign: TextAlign.center,
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Status',
                                                textAlign: TextAlign.center,
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: SizedBox(
                                      height: 400,
                                      child: FutureBuilder<DocumentSnapshot>(
                                          future: reference
                                              .doc(widget.documentID)
                                              .get(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              dynamic data = snapshot.data!
                                                  .data() as dynamic;

                                              final specificUserId =
                                                  data["userId"];

                                              return _buildSpecificFarmerWalletList(
                                                  specificUserId);
                                            } else {
                                              return Center(
                                                child: SizedBox(
                                                  width: 10,
                                                  height: 10,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: greenNormalHover,
                                                  ),
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ),
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
        ],
      ),
    );
  }

  Widget _buildSpecificFarmerWalletList(String specificUserId) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerWallet')
          .where('userId', isEqualTo: specificUserId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(
                color: greenNormalHover,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final logs = snapshot.data!.docs;

          if (logs.isEmpty) {
            return const Center(
              child: Text('No farmer wallet history available!'),
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

          return ListView(
            children: logs.map<Widget>((document) {
              return _buildSpecificFarmerWalletListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildSpecificFarmerWalletListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
    String timeListTile = DateFormat('hh:mm a').format(dateTime);

    //THIS IS FOR DISPLAYING THE PROOF PHOTO FOR THE WALLET CASH IN
    String statusType = data["status"];
    String requestType = data["request"];

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["request"].toString().toLowerCase() == searchValueLowerCase ||
          data["amount"].toString().toLowerCase() == searchValueLowerCase ||
          data["status"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: GestureDetector(
            child: Container(
              width: 780,
              height: 50,
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
                children: [
                  //this holds the date and time
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dateFinal,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data["request"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data["amount"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //this holds the amount purchased
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${data["status"]}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*if each tile kay imo iclick then naay mugawas na dialog box
              which is nag consist na siya sa details sa kana na transaction*/
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Container(
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        5,
                      )),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x21000000),
                          blurRadius: 10,
                          offset: Offset(6, 2),
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
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ),
                  content: SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
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
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                dateFinal,
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Time : ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                timeListTile,
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                "${data["request"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data["userId"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
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
                              Expanded(
                                child: Text(
                                  "Name: ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${data["firstname"]} " +
                                      "${data["lastname"]} ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
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
                              Expanded(
                                child: Text(
                                  "Mobile Number: ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${data["contactnum"]} ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
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
                              Expanded(
                                child: Text(
                                  "Address: ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${data["address"]} ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
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
                              Expanded(
                                child: Text(
                                  "Amount: ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${data["amount"]} ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          //row for the transaction status
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Status: ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "${data["status"]} ",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (requestType == "cash in")
                            //the profile photo for the cash in
                            Column(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Proof of payment:",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 300,
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xFF27CB7D),
                                        Color(0xFF4EE48A)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: data["proofPhoto"],
                                    width: 300,
                                    height: 400,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                )
                              ],
                            ),
                          if (requestType == "cash out")
                            //the profile photo for the cash in
                            Column(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Proof of payment: (uploaded by admin)",
                                  style: Poppins.adminName.copyWith(
                                    color: const Color(0xFF09041B),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  height: 300,
                                  decoration: ShapeDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [
                                        Color(0xFF27CB7D),
                                        Color(0xFF4EE48A)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: data["proofPhoto"],
                                    width: 300,
                                    height: 400,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    if (statusType == "pending")
                      TextButton(
                        child: const Text("Review Request"),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Close the second AlertDialog
                          Navigator.of(context)
                              .pushNamed(RoutesManager.requestwalletpage);
                        },
                      ),
                    TextButton(
                      child: const Text("Close"),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the second AlertDialog
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      }
    }

    //if search bar is empty this one will display
    else {
      return ListTile(
        title: GestureDetector(
          child: Container(
            width: 780,
            height: 50,
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
              children: [
                //this holds the date and time
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateFinal,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data["request"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data["amount"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                //this holds the amount purchased
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data["status"]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        /*if each tile kay imo iclick then naay mugawas na dialog box
              which is nag consist na siya sa details sa kana na transaction*/
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Container(
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      5,
                    )),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x21000000),
                        blurRadius: 10,
                        offset: Offset(6, 2),
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
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ),
                content: SizedBox(
                  height: 300,
                  child: SingleChildScrollView(
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
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              dateFinal,
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Time : ",
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              timeListTile,
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
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
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${data["request"]} ",
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
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
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${data["userId"]} ",
                              style: Poppins.adminName.copyWith(
                                color: const Color(0xFF09041B),
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
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
                            Expanded(
                              child: Text(
                                "Name: ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${data["firstname"]} " +
                                    "${data["lastname"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                            Expanded(
                              child: Text(
                                "Mobile Number: ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${data["contactnum"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                            Expanded(
                              child: Text(
                                "Address: ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${data["address"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
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
                            Expanded(
                              child: Text(
                                "Amount: ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${data["amount"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        //row for the transaction status
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Status: ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${data["status"]} ",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (requestType == "cash in")
                          //the profile photo for the cash in
                          Column(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Proof of payment:",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 300,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [
                                      Color(0xFF27CB7D),
                                      Color(0xFF4EE48A)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: data["proofPhoto"],
                                  width: 300,
                                  height: 400,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              )
                            ],
                          ),
                        if (requestType == "cash out")
                          //the profile photo for the cash in
                          Column(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Proof of payment: (uploaded by admin)",
                                style: Poppins.adminName.copyWith(
                                  color: const Color(0xFF09041B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 250,
                                height: 300,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [
                                      Color(0xFF27CB7D),
                                      Color(0xFF4EE48A)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: data["proofPhoto"],
                                  width: 300,
                                  height: 400,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  if (statusType == "pending")
                    TextButton(
                      child: const Text("Review Request"),
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Close the second AlertDialog
                        Navigator.of(context)
                            .pushNamed(RoutesManager.requestwalletpage);
                      },
                    ),
                  TextButton(
                    child: const Text("Close"),
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Close the second AlertDialog
                    },
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return Container();
  }
}
