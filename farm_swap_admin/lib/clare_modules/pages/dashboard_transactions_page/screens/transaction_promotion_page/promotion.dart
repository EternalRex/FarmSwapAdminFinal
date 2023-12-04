import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/transaction_promotion_page/screens/barterpromotion_transaction.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/transaction_promotion_page/screens/sellpromotion_transaction.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/trans_logo/translogo.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/transactions_buttons/transactions_buttons.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'widgets/third_expanded.dart';

class TransactionPromotion extends StatefulWidget {
  const TransactionPromotion({super.key});

  @override
  State<TransactionPromotion> createState() => _TransactionPromotionState();
}

class _TransactionPromotionState extends State<TransactionPromotion> {
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
                    Spacer(),
                    LogoutBttn(),
                  ],
                ),
              ),
            ),
          ),

          //second expanded of the transaction page
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
                  title: transactionTitle(),
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
                          child: DefaultTabController(
                            length: 2,
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
                                                      width: 150, height: 45),
                                              child: const Text(
                                                "Sell",
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
                                                      width: 150, height: 45),
                                              child: const Text(
                                                "Barter",
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
                                Expanded(
                                  child: SizedBox(
                                    //this will show the different tab bar view of the different tabs
                                    child: TabBarView(children: [
                                      SellPromotiomTabBarView(),
                                      BarterPromotionTabBarView(),
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

          //the third expanded with right side menu buttons
          const ThirdExpandedPromotion()
        ],
      ),
    );
  }
}
