import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_bell_btn/dhsb_notif.dart.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_graph_widgets/widget_dashboard_linegraph.dart';
import 'package:farm_swap_admin/routes/routes.dart';
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
import '../widgets/dshb_graph_widgets/widget_dashboard_piegraph.dart';
import '../widgets/dshb_textfield_widgets/widget_dashboard_search.dart';
import '../widgets/dshb_graph_widgets/widget_dashboard_selling_bargraph.dart';
import '../widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    const DashAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    const DashUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    const DashListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    const DashTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    const DashReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    const DashDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    const DashWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    const SizedBox(
                      height: 10,
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
                  /*IN THE  APPBAR, WE USED THE ACTIONS PROPERTY SO THAT WE CAN PUT
                  A LOT OF WIDGETS IN THE APPBAR, IN HERE IT IS USED SO THAT WE CAN PUT 
                  A TEXT FIELD WIDGET FOR SEARCHING*/
                  actions: const [
                    /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
                    Padding(
                      padding: EdgeInsets.all(10),
                      /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                      HEIGH AND WIDTH OF THE TEXT FIELD */
                      child: SizedBox(
                        width: 250,
                        height: 15,
                        /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                        IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
                        child: DashBSearchBar(),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
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
                                    myFont: GoogleFonts.viga().fontFamily,
                                    myWeight: FontWeight.w800),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: shadow,
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                    ),
                                  ], color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: DashboardLineChart(
                                      points: pricePoints,
                                      points2: pricePoints2,
                                      points3: pricePoints3,
                                    ),
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
                                    myFont: GoogleFonts.viga().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: shadow,
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                    ),
                                  ], color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: DashBoardPieChart(),
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
                                    myFont: GoogleFonts.viga().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: shadow,
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                    ),
                                  ], color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: DashBoardBarChart(),
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
                                    myFont: GoogleFonts.viga().fontFamily,
                                    myWeight: FontWeight.bold),
                                Container(
                                  width: 380,
                                  height: 300,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: shadow,
                                      blurRadius: 2,
                                      offset: const Offset(1, 2),
                                    ),
                                  ], color: Colors.white),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 0),
                                    child: SellingBarGraph(),
                                  ),
                                ),
                              ],
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
                          /*IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(RoutesManager.notificationAdminPage);
                            },
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: farmSwapTitlegreen,
                            ),
                          ),*/
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
}
