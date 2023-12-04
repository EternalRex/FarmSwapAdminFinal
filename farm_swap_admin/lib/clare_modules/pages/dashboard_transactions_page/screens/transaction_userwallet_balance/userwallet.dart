import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/trans_logo/translogo.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import '../../../../../karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import '../../widgets/text/transaction_typography.dart';
import '../../widgets/transactions_buttons/transactions_buttons.dart';
import 'screens/consumerwallet_transaction.dart';
import 'screens/farmerwallet_transaction.dart';

class UserWalletScreen extends StatefulWidget {
  const UserWalletScreen({super.key});

  @override
  State<UserWalletScreen> createState() => _UserWalletScreenState();
}

class _UserWalletScreenState extends State<UserWalletScreen> {
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
                                                "Farmer",
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
                                                "Consumer",
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
                                      FarmerWalletTabBarView(),
                                      ConsumerWalletTabBarView(),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
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
}
