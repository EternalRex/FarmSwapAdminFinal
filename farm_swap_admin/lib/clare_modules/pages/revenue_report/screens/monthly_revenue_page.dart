import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/Colors/colors_rollaine.dart';
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
import '../widgets/april_revenue_report.dart';
import '../widgets/august__revenue_report.dart';
import '../widgets/december__revenue_report.dart';
import '../widgets/february_revenue_report.dart';
import '../widgets/january_revenue_report.dart';
import '../widgets/july_revenue_report.dart';
import '../widgets/june_revenue_report.dart';
import '../widgets/march_revenue_report.dart';
import '../widgets/may_revenue_report.dart';
import '../widgets/november__revenue_report.dart';
import '../widgets/october__revenue_report.dart';
import '../widgets/september__revenue_report.dart';

class MonthlyRevenueReportPage extends StatefulWidget {
  const MonthlyRevenueReportPage({
    super.key,
  });
  @override
  State<MonthlyRevenueReportPage> createState() =>
      _MonthlyRevenueReportPageState();
}

class _MonthlyRevenueReportPageState extends State<MonthlyRevenueReportPage> {
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
            flex: 5,
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
                          .pushNamed(RoutesManager.revenuereport);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Monthly Revenue Reports",
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
                          child: DefaultTabController(
                            length: 12,
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
                                    constraints:
                                        const BoxConstraints.expand(height: 45),
                                    child: TabBar(
                                        isScrollable: true,
                                        labelColor: Colors.black,
                                        unselectedLabelColor: Colors.grey,
                                        indicator: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        //mao ni ang tab button which is nag contain sa 12 months
                                        tabs: [
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "January",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "February",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "March",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "April",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "May",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "June",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "July",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "August",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "September",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "October",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "November",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints:
                                                  const BoxConstraints.expand(
                                                      width: 130, height: 45),
                                              child: const Text(
                                                "December",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: poppins,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    //this will show the different tab bar view of the different tabs
                                    child: TabBarView(children: [
                                      JanuaryRevenueTabBarView(),
                                      FebruaryRevenueTabBarView(),
                                      MarchRevenueTabBarView(),
                                      AprilRevenueTabBarView(),
                                      MayRevenueTabBarView(),
                                      JuneRevenueTabBarView(),
                                      JulyRevenueTabBarView(),
                                      AugustRevenueTabBarView(),
                                      SeptemberRevenueTabBarView(),
                                      OctoberRevenueTabBarView(),
                                      NovemberRevenueTabBarView(),
                                      DecemberRevenueTabBarView(),
                                    ]),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
