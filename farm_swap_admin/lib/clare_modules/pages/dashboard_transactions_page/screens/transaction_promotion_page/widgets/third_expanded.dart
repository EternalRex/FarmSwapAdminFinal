import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class ThirdExpandedPromotion extends StatelessWidget {
  const ThirdExpandedPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                                  RoutesManager.adminTransactionsPromotion);
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
                                  RoutesManager.adminTransactionsSwapCoins);
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
                                  RoutesManager.adminTransactionsUserWallet);
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
    );
  }
}
