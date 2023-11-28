import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_bell_btn/dhsb_notif.dart.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/dashboard_bartertranschart.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/dashboard_linechart.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/dashboard_piechart.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/dashboard_selltrans.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/widget_dashboard_linegraph.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter/cupertino.dart';
import '../../../../constants/Colors/colors.dart';
import '../data/testData/DashboardLineGraph/price_point.dart';
import '../data/testData/DashboardLineGraph/price_point2.dart';
import '../data/testData/DashboardLineGraph/price_point3.dart';
import '../widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_edit_admin_profile_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_recent_activities_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';
import '../widgets/dshb_graph_widgets/widget_dashboard_barter_bargraph.dart';
import '../widgets/dshb_textfield_widgets/widget_dashboard_search.dart';
import '../widgets/dshb_graph_widgets/widget_dashboard_selling_bargraph.dart';
import '../widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  //Variable na selected id nga String
  String selectedId = '';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int touchedIndex = -1;
  late double activeUsers = 0.0;
  late double archivedUsers = 0.0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final CollectionReference farmerActive =
        FirebaseFirestore.instance.collection('sample_FarmerUsers');
    final CollectionReference consumerActive =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    final CollectionReference farmerArchived =
        FirebaseFirestore.instance.collection('sample_FarmerArchived');
    final CollectionReference consumerArchived =
        FirebaseFirestore.instance.collection('sample_ConsumerArchived');

    QuerySnapshot activeFarmerSnapshot =
        await farmerActive.where('accountStatus', isEqualTo: 'Active').get();
    QuerySnapshot activeConsumerSnapshot =
        await consumerActive.where('accountStatus', isEqualTo: 'ACTIVE').get();
    QuerySnapshot archivedFarmerSnapshot = await farmerArchived
        .where('accountStatus', isEqualTo: 'Archived')
        .get();
    QuerySnapshot archivedConsumerSnapshot = await consumerArchived
        .where('accountStatus', isEqualTo: 'ARCHIVED')
        .get();

    final totalActiveUsers =
        (activeFarmerSnapshot.size + activeConsumerSnapshot.size);
    final totalArchivedUsers =
        (archivedFarmerSnapshot.size + archivedConsumerSnapshot.size);

    setState(() {
      activeUsers =
          (totalActiveUsers / (totalActiveUsers + totalArchivedUsers)) * 100;
      archivedUsers =
          (totalArchivedUsers / (totalActiveUsers + totalArchivedUsers)) * 100;
    });
  }

  //creates an instance of TextEditingController named searchAdminController.
  TextEditingController searchAdminController = TextEditingController();
  //store the search query entered by the user for searching admins.
  String adminSearchValue = '';

  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchFarmerController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String farmerSearchValue = '';

  //creates an instance of TextEditingController named searchConsumerController.
  TextEditingController searchConsumerController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String consumerSearchValue = '';

  @override
  Widget build(BuildContext context) {
    DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

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
              /*WRAPPING A SCAFFOLD WITH PADDING SO THAT IT WILL HAVE SOME SPACE
              FROM THE BORDERS OF THE OTHER 2 DIVISIONS */
              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
              /*PUTTING A SCAFFOLD INSIDE THE  CENTER CONTAINER SO THAT WE CAN
              USE THE BODY PROPERTY AND DECLARE SOME COLUMN OR ROWS THAT WILL HAVE
              A CHILDREN PROPERTY WHERE WE CAN PUT A LOT OF WIDGETS HEHEHE */
              child: Scaffold(
                /*THIS IS AN APPBAR OF THE CENTER DIVISION THAT HAS THE DASHBOARD TITLE AND THE 
                SEARCH BAR */
                appBar: AppBar(
                  /*PUTTING AND STYLING THE DASHBOARD TITLE. I USED THE TEXT CLASS THAT I CREATED IN
                  THIS TITLE, THAT CLASS CAN BE FOUND IN WIDGET_DASHBOARD_TXT.DART*/
                  title: const DashBoardTitleText(
                    myText: "Dashboard",
                    myColor: Color(0xFF09041B),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                ),
/*START OF THE SECOND EXPANDEDS BODY */
                body: SingleChildScrollView(
                  child: Padding(
                    /*WRAPPING THE BODY WITH PADDING SO THAT IT WILL NOT TOUCH THE BORDERS OF
                    OF OTHER EXPANDEDS */
                    padding: const EdgeInsets.all(20),
                    /*A COLUMN THAT WILL HOLD THE WIDGETS OF THE BODY */
                    child: Column(
                      children: [
                        /*A FIRST ROW CHILDREN THAT WILL HOLD LINE GRAPH AND THE CIRCLE GRAPH AS
                        FIRST ROWS OF THE BODY */
                        Row(
                          children: [
                            /*LINE GRAPH COLUMN, A COLUMN AS A CHILD OF THE FIRST ROW, THAT IS ASSIGNED TO HOLD THE LINE
                            GRAPH AND ITS TEXT LABLE "REVENUE" */
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DashBoardTxt(
                                    myText: "Revenue",
                                    myColor: const Color(0xFF09041B),
                                    mySize: 30,
                                    myFont: GoogleFonts.poppins().fontFamily,
                                    myWeight: FontWeight.w800),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadow,
                                          blurRadius: 2,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                      color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15),
                                    child: RevenueLineChart(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            /*PIE GRAPH COLUMN*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DashBoardTxt(
                                    myText: "Users",
                                    myColor: const Color(0xFF09041B),
                                    mySize: 30,
                                    myFont: GoogleFonts.poppins().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadow,
                                          blurRadius: 2,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                      color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: UsersPieChart(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        /*SECOND ROW THAT WILL HOLD THE BARGRAPHS */
                        Row(
                          children: [
                            /*HOLDER FOR BARTER BAR GRAPH */
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DashBoardTxt(
                                    myText: "Barter Transactions",
                                    myColor: const Color(0xFF09041B),
                                    mySize: 30,
                                    myFont: GoogleFonts.poppins().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadow,
                                          blurRadius: 2,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                      color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: BarterTransChart(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            /*HOLDER FOR SELLING BAR GRAPH */
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DashBoardTxt(
                                    myText: "Sale Transactions",
                                    myColor: const Color(0xFF09041B),
                                    mySize: 30,
                                    myFont: GoogleFonts.poppins().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shadow,
                                          blurRadius: 2,
                                          offset: const Offset(1, 2),
                                        ),
                                      ],
                                      color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: SellTransChart(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Archived Accounts',
                                    style: Poppins.pageTitle.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 15),
                                child: Container(
                                  height: 535,
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
                                  child: DefaultTabController(
                                    length: 3,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 10,
                                            right: 10,
                                            bottom: 15,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment(0.99, -0.15),
                                                end: Alignment(-0.99, 0.15),
                                                colors: [
                                                  Color(0xFF53E78B),
                                                  Color(0xFF14BE77)
                                                ],
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                            constraints:
                                                const BoxConstraints.expand(
                                                    height: 45),
                                            child: TabBar(
                                                isScrollable: true,
                                                labelColor: Colors.black,
                                                unselectedLabelColor:
                                                    Colors.grey,
                                                indicator: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                //mao ni ang tab button which is nag contain sa 12 months
                                                tabs: [
                                                  Tab(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          const BoxConstraints
                                                              .expand(
                                                              width: 150,
                                                              height: 45),
                                                      child: const Text(
                                                        "Admin",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: poppins,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          const BoxConstraints
                                                              .expand(
                                                              width: 150,
                                                              height: 45),
                                                      child: const Text(
                                                        "Farmer",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: poppins,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      constraints:
                                                          const BoxConstraints
                                                              .expand(
                                                              width: 150,
                                                              height: 45),
                                                      child: const Text(
                                                        "Consumer",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: poppins,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            //this will show the different tab bar view of the different tabs
                                            child: TabBarView(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5,
                                                                bottom: 15),
                                                        child: Container(
                                                          height: 500,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Column(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                420,
                                                                            width:
                                                                                760,
                                                                            child:
                                                                                _buildAdminArchiveList(),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5,
                                                                bottom: 15),
                                                        child: Container(
                                                          height: 500,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Column(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                420,
                                                                            width:
                                                                                760,
                                                                            child:
                                                                                _buildFarmerArchiveList(),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5,
                                                                bottom: 15),
                                                        child: Container(
                                                          height: 500,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Column(
                                                                children: <Widget>[
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        bottom:
                                                                            10),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                420,
                                                                            width:
                                                                                760,
                                                                            child:
                                                                                _buildConsumerArchiveList(),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.chatpage);
                            },
                            icon: Icon(
                              CupertinoIcons.envelope,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                          /*NOTIFICATIOIN BUTTON */
                          const DashboardNotifBtn(),
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
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
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
                    const SizedBox(
                      height: 10,
                    ),

                    /*EDIT PROFILE BUTTON */
                    const AdminEditProfileBtn(),
                    const SizedBox(
                      height: 30,
                    ),
                    /*ADMIN RECENT ACTIVITIES BUTTON */
                    AdminRecentActivitiesBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Admin

  //returns a widget for displaying a list of items.
  Widget _buildAdminArchiveList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('AdminArchivedUsers')
          .snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .where((document) => document['Account Status'] == 'Archived')
                  .map<Widget>(
                      (document) => _buildAdminArchiveListItems(document))
                  .toList(),
            ),
          );
        } else {
          //This is a loading indicator that informs the user that data is being fetched.
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF14BE77),
              ),
            ),
          );
        }
      },
    );
  }

  //responsible for creating a widget to represent a farmer
  Widget _buildAdminArchiveListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> admin = document.data() as Map<String, dynamic>;

    //checks if a searchValue variable is not empty
    if (adminSearchValue.isNotEmpty) {
      //checks whether the searchValue matches any of the farmer's attributes
      if (admin['First Name'] == adminSearchValue ||
          admin['Last Name'] == adminSearchValue ||
          admin['Email Address'] == adminSearchValue) {
        //displaying a single row in a list
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
                //Row where the profile, first name, last name, and details
                Row(
                  children: [
                    //this padding holds the profile image of the admin
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: admin["profileUrl"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${admin["First Name"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${admin["Last Name"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          SizedBox(
                            height: 27,
                            width: 60,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 173, 173, 173),
                                    Color.fromARGB(255, 173, 173, 173),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    'ARCHIVED',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                ),
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
    }
    //certain actions or access is restricted for users whose email doesn't match the email associated with the farmer's data
    else if (FirebaseAuth.instance.currentUser!.email !=
        admin['Email Address']) {
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
              //Row where the profile, first name, last name, and details
              Row(
                children: [
                  //this padding holds the profile image of the admin
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                      imageUrl: admin["profileUrl"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
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
                  const SizedBox(
                    width: 8,
                  ),
                  //First name of farmer
                  Text(
                    "${admin["First Name"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  //Last name of farmer
                  Text(
                    "${admin["Last Name"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        SizedBox(
                          height: 27,
                          width: 60,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 173, 173, 173),
                                  Color.fromARGB(255, 173, 173, 173),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Center(
                                child: Text(
                                  'ARCHIVED',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
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

  //Farmer

  //returns a widget for displaying a list of items.
  Widget _buildFarmerArchiveList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerArchived')
          .snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .where((document) => document['accountStatus'] == 'Archived')
                  .map<Widget>(
                      (document) => _buildFarmerArchiveListItems(document))
                  .toList(),
            ),
          );
        } else {
          //This is a loading indicator that informs the user that data is being fetched.
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF14BE77),
              ),
            ),
          );
        }
      },
    );
  }

  //responsible for creating a widget to represent a farmer
  Widget _buildFarmerArchiveListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> farmer = document.data() as Map<String, dynamic>;

    //checks if a searchValue variable is not empty
    if (adminSearchValue.isNotEmpty) {
      //checks whether the searchValue matches any of the farmer's attributes
      if (farmer['firstname'] == farmerSearchValue ||
          farmer['lastname'] == farmerSearchValue ||
          farmer['email'] == farmerSearchValue) {
        //displaying a single row in a list
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
                //Row where the profile, first name, last name, and details
                Row(
                  children: [
                    //this padding holds the profile image of the admin
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: farmer["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${farmer["firstname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${farmer["lastname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          SizedBox(
                            height: 27,
                            width: 60,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 173, 173, 173),
                                    Color.fromARGB(255, 173, 173, 173),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    'ARCHIVED',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                ),
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
    }
    //certain actions or access is restricted for users whose email doesn't match the email associated with the farmer's data
    else if (FirebaseAuth.instance.currentUser!.email != farmer['email']) {
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
              //Row where the profile, first name, last name, and details
              Row(
                children: [
                  //this padding holds the profile image of the admin
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                      imageUrl: farmer["profilePhoto"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
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
                  const SizedBox(
                    width: 8,
                  ),
                  //First name of farmer
                  Text(
                    "${farmer["firstname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  //Last name of farmer
                  Text(
                    "${farmer["lastname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        SizedBox(
                          height: 27,
                          width: 60,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 173, 173, 173),
                                  Color.fromARGB(255, 173, 173, 173),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Center(
                                child: Text(
                                  'ARCHIVED',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
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

  //Consumer

  //returns a widget for displaying a list of items.
  Widget _buildConsumerArchiveList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('sample_ConsumerArchived')
          .snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .where((document) => document['accountStatus'] == 'ARCHIVED')
                  .map<Widget>(
                      (document) => _buildConsumerArchiveListItems(document))
                  .toList(),
            ),
          );
        } else {
          //This is a loading indicator that informs the user that data is being fetched.
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF14BE77),
              ),
            ),
          );
        }
      },
    );
  }

  //responsible for creating a widget to represent a farmer
  Widget _buildConsumerArchiveListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> consumer = document.data() as Map<String, dynamic>;

    //checks if a searchValue variable is not empty
    if (adminSearchValue.isNotEmpty) {
      //checks whether the searchValue matches any of the farmer's attributes
      if (consumer['firstname'] == consumerSearchValue ||
          consumer['lastname'] == consumerSearchValue ||
          consumer['email'] == consumerSearchValue) {
        //displaying a single row in a list
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
                //Row where the profile, first name, last name, and details
                Row(
                  children: [
                    //this padding holds the profile image of the admin
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: consumer["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${consumer["firstname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${consumer["lastname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          SizedBox(
                            height: 27,
                            width: 60,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 173, 173, 173),
                                    Color.fromARGB(255, 173, 173, 173),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    'ARCHIVED',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.50,
                                    ),
                                  ),
                                ),
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
    }
    //certain actions or access is restricted for users whose email doesn't match the email associated with the farmer's data
    else if (FirebaseAuth.instance.currentUser!.email != consumer['email']) {
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
              //Row where the profile, first name, last name, and details
              Row(
                children: [
                  //this padding holds the profile image of the admin
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                      imageUrl: consumer["profilePhoto"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
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
                  const SizedBox(
                    width: 8,
                  ),
                  //First name of farmer
                  Text(
                    "${consumer["firstname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  //Last name of farmer
                  Text(
                    "${consumer["lastname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        SizedBox(
                          height: 27,
                          width: 60,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 173, 173, 173),
                                  Color.fromARGB(255, 173, 173, 173),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Center(
                                child: Text(
                                  'ARCHIVED',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
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
