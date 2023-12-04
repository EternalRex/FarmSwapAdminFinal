import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/transaction_swapcoins/widget/farmer_update_swapcoins.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../wallet_management_balance/widget/wallet_textfield.dart';

// ignore: must_be_immutable
class FarmerSwapcoinsTabBarView extends StatefulWidget {
  FarmerSwapcoinsTabBarView({super.key, this.documentID});
  final String? documentID;
  String selectedId = "";

  @override
  State<FarmerSwapcoinsTabBarView> createState() =>
      _FarmerSwapcoinsTabBarViewState();
}

TextEditingController searchController = TextEditingController();
String searchValue = "";

class _FarmerSwapcoinsTabBarViewState extends State<FarmerSwapcoinsTabBarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
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
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
            child: Row(
              children: [
                const Text(
                  'Farmer Swapcoins History',
                  style: TextStyle(
                    color: Color(0xFF09041B),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: searchController,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFDA6317),
                      height: 1.5,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      filled: true,
                      fillColor: const Color(0xFFF9A84D).withOpacity(0.10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search here',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFDA6317),
                        size: 18,
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
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 10),
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Date and Time",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Status",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SizedBox(
                height: 320,
                child: _buildSwapCoinsList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  //this is for the farmer collection build list
  Widget _buildSwapCoinsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_SwapCoinsLogs')
          .where('userRole', isEqualTo: 'FARMER')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
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
              child: Text('No transactions available!'),
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
              return _buildSwapCoinsListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildSwapCoinsListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
    String timeListTile = DateFormat('hh:mm a').format(dateTime);

    //creating variable para sa status, if ang status kay failed naay reason mugawas
    String statusType = data["status"];
    String role = data["userRole"];

    TextEditingController amountController = TextEditingController();
    FarmerUpdateSwapcoins farmerupdateSwapcoins = FarmerUpdateSwapcoins();

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["swapcoins"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          data["address"].toString().toLowerCase() == searchValueLowerCase ||
          data["status"].toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: Container(
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
                //this expanded holding the profilepic, firstname, last name and address of the user
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),

                      //this will display the users profile picture in each listtile
                      CachedNetworkImage(
                        imageUrl: data["profile"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          print("Error loading image: $error");
                          return const Icon(Icons.error);
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${data["firstname"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                " ${data["lastname"]}",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                " ${data["address"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        timeListTile,
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

                //this holds the swapcoins amount purchased
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
                      //icon button for adding a balance to the wallet
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          size: 20,
                          color: Colors.blue,
                        ),
                        onPressed: () async {
                          setState(() {
                            widget.selectedId = "${data["userId"]}";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Additional Swapcoins to ${data["firstname"]} ${data["lastname"]}."),
                                  content: Container(
                                    width: 400,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                            "Enter additional swapcoins : "),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        WalletTextField(
                                          controller: amountController,
                                          enabled: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Add"),
                                      onPressed: () async {
                                        if (role == "FARMER") {
                                          /*
                                      In this function when the ADD button is clicked 
                                      it will update the selected id the balance 
                                      */

                                          await farmerupdateSwapcoins
                                              .updateSwapcoins(
                                                  amountController.text,
                                                  widget.selectedId);
                                          AdminLogsInsertDataDb adminLogs =
                                              AdminLogsInsertDataDb();
                                          //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                          final email = FirebaseAuth
                                              .instance.currentUser!.email;
                                          final userId = FirebaseAuth
                                              .instance.currentUser!.uid;
                                          /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                          adminLogs.createAdminLogs(
                                              email,
                                              userId,
                                              "Add_Farmer_Swapcoins",
                                              DateTime.now());

                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context)
                                              .pop(); // Close the AlertDialog

                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Successful'),
                                                content: const Text(
                                                    'You successfully add swapcoins to this account!'),
                                                actions: [
                                                  TextButton(
                                                    child: const Text("Ok"),
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop(); // Close the AlertDialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                      //icon button for deducting a balance to the wallet
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.selectedId = "${data["userId"]}";
                          });
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      "Deduct swapcoins of ${data["firstname"]} ${data["lastname"]}."),
                                  content: Container(
                                    width: 400,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                            "Enter deduction swapcoins : "),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        WalletTextField(
                                          controller: amountController,
                                          enabled: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Deduct"),
                                      onPressed: () async {
                                        if (role == "FARMER") {
                                          FarmerCheckSwapcoins checkSwapcoins =
                                              FarmerCheckSwapcoins();
                                          final swapcoins = await checkSwapcoins
                                              .getSwapcoinsFromFirestore(
                                                  widget.selectedId);
                                          // Parsing the amountController.text into double
                                          final deductAmount = double.parse(
                                              amountController.text);
                                          if (swapcoins >= deductAmount) {
                                            AdminLogsInsertDataDb adminLogs =
                                                AdminLogsInsertDataDb();
                                            //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                            final email = FirebaseAuth
                                                .instance.currentUser!.email;
                                            final userId = FirebaseAuth
                                                .instance.currentUser!.uid;
                                            /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                            adminLogs.createAdminLogs(
                                                email,
                                                userId,
                                                "Deduct_Farmer_Swapcoins",
                                                DateTime.now());
                                            /*
                                      In this function when the DEDUCT button is clicked 
                                      it will update the selected id the balance 
                                      */

                                            await farmerupdateSwapcoins
                                                .updateDeduct(
                                                    amountController.text,
                                                    widget.selectedId);

                                            // ignore: use_build_context_synchronously
                                            Navigator.of(context)
                                                .pop(); // Close the AlertDialog
                                            // ignore: use_build_context_synchronously
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title:
                                                      const Text('Successful'),
                                                  content: const Text(
                                                      'You successfully deduct swapcoins to this account!'),
                                                  actions: [
                                                    TextButton(
                                                      child: const Text("Ok"),
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop(); // Close the AlertDialog
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Warning!'),
                                                content: const Text(
                                                    'This account has lower swapcoins. Please try again!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),

                      IconButton(
                          onPressed: () {
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
                                            offset: Offset(3, 2),
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
                                      height: 230,
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
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "$dateFinal $timeListTile",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          //row for status
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Status : ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${data["status"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
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
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${data["userId"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "User : ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${data["userRole"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
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
                                              Text(
                                                "Name: ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${data["firstname"]} " +
                                                      "${data["lastname"]} ",
                                                  style: Poppins.adminName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                    fontSize: 15,
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
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${data["address"]} ",
                                                  style: Poppins.adminName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                    fontSize: 15,
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
                                                "Swap coins : ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "${data["swapcoins"]} ",
                                                  style: Poppins.adminName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                    fontSize: 15,
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

                                          //if the status is failed therefore this row will display kauban sa uban na row
                                          if (statusType == "FAILED")
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Reason: ",
                                                  style: Poppins.adminName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "Insufficient Balance.",
                                                    style: Poppins.adminName
                                                        .copyWith(
                                                      color: const Color(
                                                          0xFF09041B),
                                                      fontSize: 15,
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
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("Close"),
                                        onPressed: () async {
                                          Navigator.of(context)
                                              .pop(); // Close the AlertDialog
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.info,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    //if search bar is empty this one will display
    else {
      return ListTile(
        title: Container(
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
              //this expanded holding the profilepic, firstname, last name and address of the user
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),

                    //this will display the users profile picture in each listtile
                    CachedNetworkImage(
                      imageUrl: data["profile"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 20,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        print("Error loading image: $error");
                        return const Icon(Icons.error);
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${data["firstname"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              " ${data["lastname"]}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              " ${data["address"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
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
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      timeListTile,
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

              //this holds the swapcoins amount purchased
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
                    //icon button for adding a balance to the wallet
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 20,
                        color: Colors.blue,
                      ),
                      onPressed: () async {
                        setState(() {
                          widget.selectedId = "${data["userId"]}";
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Additional Swapcoins to ${data["firstname"]} ${data["lastname"]}."),
                                content: Container(
                                  width: 400,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Enter additional swapcoins : "),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      WalletTextField(
                                        controller: amountController,
                                        enabled: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Add"),
                                    onPressed: () async {
                                      if (role == "FARMER") {
                                        /*
                                      In this function when the ADD button is clicked 
                                      it will update the selected id the balance 
                                      */

                                        await farmerupdateSwapcoins
                                            .updateSwapcoins(
                                                amountController.text,
                                                widget.selectedId);
                                        AdminLogsInsertDataDb adminLogs =
                                            AdminLogsInsertDataDb();
                                        //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                        final email = FirebaseAuth
                                            .instance.currentUser!.email;
                                        final userId = FirebaseAuth
                                            .instance.currentUser!.uid;
                                        /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                        adminLogs.createAdminLogs(
                                            email,
                                            userId,
                                            "Add_Farmer_Swapcoins",
                                            DateTime.now());

                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog

                                        // ignore: use_build_context_synchronously
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Successful'),
                                              content: const Text(
                                                  'You successfully add swapcoins to this account!'),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Ok"),
                                                  onPressed: () async {
                                                    Navigator.of(context)
                                                        .pop(); // Close the AlertDialog
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Close"),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the AlertDialog
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                    //icon button for deducting a balance to the wallet
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.selectedId = "${data["userId"]}";
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "Deduct swapcoins of ${data["firstname"]} ${data["lastname"]}."),
                                content: Container(
                                  width: 400,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Enter deduction swapcoins : "),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      WalletTextField(
                                        controller: amountController,
                                        enabled: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Deduct"),
                                    onPressed: () async {
                                      if (role == "FARMER") {
                                        FarmerCheckSwapcoins checkSwapcoins =
                                            FarmerCheckSwapcoins();
                                        final swapcoins = await checkSwapcoins
                                            .getSwapcoinsFromFirestore(
                                                widget.selectedId);
                                        // Parsing the amountController.text into double
                                        final deductAmount =
                                            double.parse(amountController.text);
                                        if (swapcoins >= deductAmount) {
                                          AdminLogsInsertDataDb adminLogs =
                                              AdminLogsInsertDataDb();
                                          //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
                                          final email = FirebaseAuth
                                              .instance.currentUser!.email;
                                          final userId = FirebaseAuth
                                              .instance.currentUser!.uid;
                                          /*So mag kuha ni siya sa admin logs nya mao ni descriptions*/
                                          adminLogs.createAdminLogs(
                                              email,
                                              userId,
                                              "Deduct_Farmer_Swapcoins",
                                              DateTime.now());
                                          /*
                                      In this function when the DEDUCT button is clicked 
                                      it will update the selected id the balance 
                                      */

                                          await farmerupdateSwapcoins
                                              .updateDeduct(
                                                  amountController.text,
                                                  widget.selectedId);

                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context)
                                              .pop(); // Close the AlertDialog
                                          // ignore: use_build_context_synchronously
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text('Successful'),
                                                content: const Text(
                                                    'You successfully deduct swapcoins to this account!'),
                                                actions: [
                                                  TextButton(
                                                    child: const Text("Ok"),
                                                    onPressed: () async {
                                                      Navigator.of(context)
                                                          .pop(); // Close the AlertDialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Warning!'),
                                              content: const Text(
                                                  'This account has lower swapcoins. Please try again!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: const Text("Close"),
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pop(); // Close the AlertDialog
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.remove_circle,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),

                    IconButton(
                        onPressed: () {
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
                                          offset: Offset(3, 2),
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
                                    height: 230,
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
                                            Text(
                                              "$dateFinal $timeListTile",
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
                                        //row for status
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Status : ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${data["status"]} ",
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
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "User : ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${data["userRole"]} ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
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
                                            Text(
                                              "Name: ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "${data["firstname"]} " +
                                                    "${data["lastname"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
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
                                            Text(
                                              "Address: ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "${data["address"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
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
                                            Text(
                                              "Swap coins : ",
                                              style: Poppins.adminName.copyWith(
                                                color: const Color(0xFF09041B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "${data["swapcoins"]} ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
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

                                        //if the status is failed therefore this row will display kauban sa uban na row
                                        if (statusType == "FAILED")
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "Reason: ",
                                                style:
                                                    Poppins.adminName.copyWith(
                                                  color:
                                                      const Color(0xFF09041B),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Insufficient Balance.",
                                                  style: Poppins.adminName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                    fontSize: 15,
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
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () async {
                                        Navigator.of(context)
                                            .pop(); // Close the AlertDialog
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
