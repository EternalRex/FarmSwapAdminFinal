import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/transactions_buttons/transactions_buttons.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';

import '../widgets/textfield/transaction_textfield.dart';

class SwapCoinHistory extends StatefulWidget {
  const SwapCoinHistory({super.key});

  @override
  State<SwapCoinHistory> createState() => _SwapCoinHistoryState();
}

class _SwapCoinHistoryState extends State<SwapCoinHistory> {
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: AssetImage(
                                "assets/clare_assets/images/logo.png"),
                            width: 35,
                            height: 30,
                          ),
                          Column(
                            children: [
                              paymentStatusTitle(),
                              paymentStatusSubTitle(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //dashboard buttons in the left side menu
                    const DashboardTransBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const AdminAccTransBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const UserAccTransBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ListingsTransBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const TransactionsBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ReportsBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const DisputeBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const WalletBttn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const CommunicationBttn(),
                    const Spacer(),
                    const LogoutBttn(),
                  ],
                ),
              ),
            ),
          ),

          //second expanded of the transaction page
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFFDA6317),
                    ),
                    splashColor: const Color(0xFFF9A84D),
                    onPressed: () {},
                  ),
                  title: transactionTitle(),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  actions: const <Widget>[
                    Center(
                      child: TransactionTextField(),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 590,
                      ),
                      child: paymentsText(
                        text: "Swap Coins Top Up History",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        width: 850,
                        height: 400,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x11000000),
                              blurRadius: 50,
                              offset: Offset(12, 26),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 31,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 100,
                                  ),
                                  child: containerText(
                                    text: "Name",
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                //The data will be inserted here
                                Container(),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 31,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 215,
                                  ),
                                  child: containerText(
                                    text: "Date",
                                  ),
                                ),

                                //The data will be inserted here
                                Container(),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 31,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 215,
                                  ),
                                  child: containerText(
                                    text: "Amount",
                                  ),
                                ),

                                //The data will be inserted here
                                Container(),
                              ],
                            ),
                          ],
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
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(-5, -5),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
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
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Image(
                            image: AssetImage(
                                "assets/clare_assets/images/notification.png"),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 200,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RoutesManager.adminTransactionsPayment);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      rightsidemenuText(
                                        text: "Payment",
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/payments.png"),
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
                                            "assets/clare_assets/images/payments.png"),
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
                                            "assets/clare_assets/images/payments.png"),
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
                                            "assets/clare_assets/images/payments.png"),
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
