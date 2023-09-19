import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class UserWalletScreen extends StatefulWidget {
  const UserWalletScreen({super.key});

  @override
  State<UserWalletScreen> createState() => _UserWalletScreenState();
}

class _UserWalletScreenState extends State<UserWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Image(
                          image:
                              AssetImage("assets/clare_assets/images/logo.png"),
                          width: 55,
                          height: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "FarmSwap",
                              style: GoogleFonts.viga(
                                fontSize: 22,
                                color: const Color(0xFF53E78B),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Modern Barter Solution",
                              style: GoogleFonts.inter(
                                fontSize: 9,
                                color: const Color(0xFF09051C),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/dashboard.png"),
                                ),
                                Text(
                                  '   Dashboard',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.adminAccount);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/admin.png"),
                                ),
                                Text(
                                  '   Admin Accounts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.userAccountPage);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/users.png"),
                                ),
                                Text(
                                  '   User Accounts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.listingsPage);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/listings.png"),
                                ),
                                Text(
                                  '   Listings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  RoutesManager.adminTransactionsPayment);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/transactions.png"),
                                ),
                                Text(
                                  '   Transactions',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.reportsPage);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/reports.png"),
                                ),
                                Text(
                                  '   Reports',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              /* Navigator.of(context)
                                  .pushNamed(RoutesManager.adminDispute);*/
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/dispute.png"),
                                ),
                                Text(
                                  '   Dispute',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              /* Navigator.of(context)
                                  .pushNamed(RoutesManager.wallet);*/
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/wallet.png"),
                                ),
                                Text(
                                  '   Wallet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.communicationPage);
                            },
                            child: const Row(
                              children: <Widget>[
                                Image(
                                  image: AssetImage(
                                      "assets/clare_assets/images/communication.png"),
                                ),
                                Text(
                                  '   Communication',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF09041B),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RoutesManager.signInPage);
                          },
                          child: const Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage(
                                    "assets/clare_assets/images/logout.png"),
                              ),
                              Text(
                                '   Logout',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF09041B),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
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
            ),
          ),
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
                  title: const Text(
                    'Transactions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF09041B),
                      fontSize: 48,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.31,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 267,
                        height: 44,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/clare_assets/images/search.png'),
                                ),
                              ),
                            ),
                            labelText: 'Search',
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0.50,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
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
                        right: 740,
                      ),
                      child: const Text(
                        'User Wallet',
                        style: TextStyle(
                          color: Color(0xFF09041B),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.31,
                        ),
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
                                  child: const Text(
                                    'Name',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09041B),
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.31,
                                    ),
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
                                  child: const Text(
                                    'Date',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09041B),
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.31,
                                    ),
                                  ),
                                ),
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
                                  child: const Text(
                                    'Balance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09041B),
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.31,
                                    ),
                                  ),
                                ),
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
                                  child: const Row(
                                    children: <Widget>[
                                      Text(
                                        'Payment',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF09041B),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.31,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(
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
                                  child: const Row(
                                    children: <Widget>[
                                      Text(
                                        'Promotion',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF09041B),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.31,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/promotion.png"),
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
                                  child: const Row(
                                    children: <Widget>[
                                      Text(
                                        'Swap Coins',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF09041B),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.31,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/swap coins.png"),
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
                                  child: const Row(
                                    children: <Widget>[
                                      Text(
                                        'Wallet',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF09041B),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.31,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "assets/clare_assets/images/wallet.png"),
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