import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/trans_logo/translogo.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/transactions_buttons/transactions_buttons.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/text/transaction_typography.dart';

class PaymentStatusScreen extends StatefulWidget {
  const PaymentStatusScreen({super.key});

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
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
                    onPressed: () {},
                  ),
                  title: transactionTitle(),
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
                            left: 10, right: 10, bottom: 15),
                        child: Container(
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
                              ]),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 45, top: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          //Content Title
                                          Text(
                                            'Payments:',
                                            style:
                                                Poppins.contentTitle.copyWith(
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
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 14),
                                        child: Container(
                                          height: 750,
                                          color: Colors.amber,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Name',
                                                  style: Poppins.farmerName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09051C),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 14),
                                        child: Container(
                                          height: 750,
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Date',
                                                  style: Poppins.farmerName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09051C),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 14),
                                        child: Container(
                                          height: 750,
                                          color: Colors.green,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Amount',
                                                  style: Poppins.farmerName
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09051C),
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
