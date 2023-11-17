import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/trans_logo/translogo.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/transactions_buttons/transactions_buttons.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SwapCoinHistory extends StatefulWidget {
  const SwapCoinHistory({super.key, this.documentID});
  final String? documentID;

  @override
  State<SwapCoinHistory> createState() => _SwapCoinHistoryState();
}

class _SwapCoinHistoryState extends State<SwapCoinHistory> {
  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //first expanded of the transaction page with left side menu
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
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    TransLogo(),
                    SizedBox(
                      height: 20,
                    ),

                    //dashboard buttons in the left side menu
                    DashboardTransBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    AdminAccTransBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    UserAccTransBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    ListingsTransBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    TransactionsBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    ReportsBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    DisputeBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    WalletBttn(),
                    SizedBox(
                      height: 15,
                    ),
                    CommunicationBttn(),
                    Spacer(),
                    LogoutBttn(),
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
                      Navigator.of(context).pushNamed(RoutesManager.dashboard);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Transactions",
                    myColor: Color(0xFF09041B),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
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
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(
                                          'Swap Coins Top Up History',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF09041B),
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            height: 0.07,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 270,
                                  ),

                                  //this align is for the container of the search textfield
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 35,
                                        ),
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
                                              contentPadding:
                                                  const EdgeInsets.all(5),
                                              filled: true,
                                              fillColor: const Color(0xFFF9A84D)
                                                  .withOpacity(0.10),
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
                                              prefixIconColor:
                                                  const Color(0xFFDA6317),
                                            ),
                                            onSubmitted: (value) {
                                              setState(() {
                                                searchValue =
                                                    searchController.text;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              //this will display the header
                              Container(
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
                                child: const Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Name',
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
                                      flex: 2,
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
                                      flex: 2,
                                      child: Text(
                                        "SwapCoins",
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

                              const SizedBox(
                                height: 10,
                              ),

                              //call the builder list
                              Container(
                                width: 780,
                                height: 350,
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
                                child: SingleChildScrollView(
                                  child: SizedBox(
                                    height: 500,
                                    child: _buildSwapCoinsList(),
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
              ),
            ),
          ),

          //the third expanded with right side menu buttons
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Image(
                            image: AssetImage(
                                "assets/clare_assets/images/message.png"),
                            height: 20,
                            width: 20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Image(
                            image: AssetImage(
                                "assets/clare_assets/images/notification.png"),
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RoutesManager
                                            .adminTransactionsPromotion);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      rightsidemenuText(
                                        text: "Promotion",
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/promotion.png"),
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RoutesManager
                                            .adminTransactionsSwapCoins);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      rightsidemenuText(
                                        text: "Swap Coins",
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/swap coins.png"),
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RoutesManager
                                            .adminTransactionsUserWallet);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      rightsidemenuText(
                                        text: "Wallet",
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/wallet.png"),
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  Widget _buildSwapCoinsList() {
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

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["swapcoins"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          data["address"].toString().toLowerCase() == searchValueLowerCase ||
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
                  child: Text(
                    "${data["swapcoins"]}",
                    textAlign: TextAlign.center,
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
                child: Text(
                  "${data["swapcoins"]}",
                  textAlign: TextAlign.center,
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
      );
    }

    return Container();
  }
}