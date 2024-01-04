import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../constants/Colors/colors_rollaine.dart';
import '../../../../karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../../../../karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';

class RevenueReportPage extends StatefulWidget {
  const RevenueReportPage({super.key, this.documentID});
  final String? documentID;

  @override
  State<RevenueReportPage> createState() => _RevenueReportPageState();
}

class _RevenueReportPageState extends State<RevenueReportPage> {
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();
  TextEditingController searchController = TextEditingController();
  String searchValue = "";

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
                          .pushNamed(RoutesManager.reportsPage);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Revenue Reports",
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
                          onSubmitted: (value) {
                            setState(() {
                              searchValue = searchController.text;
                            });
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
                              /*this will align to center left where the container is
                                the container has the overall revenue for the farmswaps wallet*/
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    //this container holds the value of the overall revenue for the admins wallet
                                    Container(
                                      width: 300,
                                      height: 50,
                                      decoration: ShapeDecoration(
                                          color: greenNormal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              blurRadius: 2,
                                              color: shadow,
                                              offset: const Offset(0, 4),
                                            )
                                          ]),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Overall Revenue',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection(
                                                      'sample_SwapCoinsLogs')
                                                  .where('status',
                                                      isEqualTo: 'COMPLETED')
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const SizedBox(
                                                    height: 5,
                                                    width: 5,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.blue,
                                                    ),
                                                  );
                                                }

                                                // Extract the documents from the snapshot
                                                List<DocumentSnapshot>
                                                    documents =
                                                    snapshot.data!.docs;

                                                // Calculate the sum of swapcoins using fold
                                                double sum = documents.fold(0.0,
                                                    (previousValue, document) {
                                                  // creating a variable for the swapcoins field
                                                  double swapcoins =
                                                      document['swapcoins'] ??
                                                          0.0;
                                                  return previousValue +
                                                      swapcoins;
                                                });

                                                // Displaying the sum of the swapcoins that status is COMPLETED
                                                return Text(
                                                  // Format the sum as a string with 2 decimal places
                                                  '₱ ${sum.toStringAsFixed(2)}',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, right: 15, bottom: 10),
                                child: Container(
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
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "Date and Time",
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
                                            "SwapCoins",
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

                              //call the builder list
                              SingleChildScrollView(
                                child: SizedBox(
                                  height: 360,
                                  child: _buildRevenueList(),
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

          /*THIRD EXPANDED THAT WILL HOLD THE FARMSWAPS WALLET BALANCE CONTENT */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    const SizedBox(
                      height: 180,
                    ),
                    //this container is for the farmswaps wallet balance
                    Container(
                      width: 190,
                      height: 150,
                      decoration: ShapeDecoration(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 170,
                          height: 130,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('sample_SwapCoinsLogs')
                                .where('status', isEqualTo: 'COMPLETED')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              }

                              // Extract the documents from the snapshot
                              List<DocumentSnapshot> documents =
                                  snapshot.data!.docs;

                              // Calculate the sum of swapcoins using fold
                              double sum = documents.fold(0.0,
                                  (previousValue, document) {
                                //creating a variable for the swapcoins field
                                double swapcoins = document['swapcoins'] ?? 0.0;
                                return previousValue + swapcoins;
                              });

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'FarmSwap’s wallet balance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    // Format the sum as a string with 2 decimal places
                                    textAlign: TextAlign.center,
                                    '₱ ${sum.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 32,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //this gesture detector is for the monthly revenue reports
                    Container(
                      width: 190,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 170,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesManager.monthlyrevenue);
                                },
                                child: const Text(
                                  'Monthly Revenue Reports',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_SwapCoinsLogs')
          .where('status', isEqualTo: 'COMPLETED')
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
              child: Text('No revenue reports available!'),
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
              return _buildRevenueListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildRevenueListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
    String timeListTile = DateFormat('hh:mm a').format(dateTime);

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["swapcoins"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          data["address"].toString().toLowerCase() == searchValueLowerCase ||
          data["dateTime"].toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase) {
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  //this expanded holding the profilepic, firstname, last name and address of the user
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CachedNetworkImage(
                          imageUrl: data["profile"] ??
                              "", // Provide a default empty string if it's null
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${data["firstname"]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  " ${data["lastname"]}",
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
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  " ${data["address"]}",
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
                      children: [
                        Text(
                          dateFinal,
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
                    flex: 1,
                    child: Text(
                      "${data["swapcoins"]}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                //this expanded holding the profilepic, firstname, last name and address of the user
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${data["firstname"]}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                " ${data["lastname"]}",
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
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                " ${data["address"]}",
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
                    children: [
                      Text(
                        dateFinal,
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
                  flex: 1,
                  child: Text(
                    "${data["swapcoins"]}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
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
