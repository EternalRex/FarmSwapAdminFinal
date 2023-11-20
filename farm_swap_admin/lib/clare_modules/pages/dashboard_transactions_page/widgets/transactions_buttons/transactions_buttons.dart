import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/widgets/text/transaction_typography.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardTransBttn extends StatefulWidget {
  const DashboardTransBttn({super.key});

  @override
  State<DashboardTransBttn> createState() => _DashboardTransBttnState();
}

class _DashboardTransBttnState extends State<DashboardTransBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.dashboard);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image:
                        AssetImage("assets/clare_assets/images/dashboard.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Dashboard",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//admin account button
class AdminAccTransBttn extends StatefulWidget {
  const AdminAccTransBttn({super.key});

  @override
  State<AdminAccTransBttn> createState() => __AdminAccTransBttnState();
}

class __AdminAccTransBttnState extends State<AdminAccTransBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.adminAccount);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/admin.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Admin Account",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//user account button
class UserAccTransBttn extends StatefulWidget {
  const UserAccTransBttn({super.key});

  @override
  State<UserAccTransBttn> createState() => __UserAccTransBttnState();
}

class __UserAccTransBttnState extends State<UserAccTransBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.userAccountPage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/users.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "User Account",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//listings button
class ListingsTransBttn extends StatefulWidget {
  const ListingsTransBttn({super.key});

  @override
  State<ListingsTransBttn> createState() => __ListingsTransBttnState();
}

class __ListingsTransBttnState extends State<ListingsTransBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.listingsPage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image:
                        AssetImage("assets/clare_assets/images/listings.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Listings",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//transactions button
class TransactionsBttn extends StatefulWidget {
  const TransactionsBttn({super.key});

  @override
  State<TransactionsBttn> createState() => __TransactionsBttnState();
}

class __TransactionsBttnState extends State<TransactionsBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.adminTransactionsPromotion);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage(
                        "assets/clare_assets/images/transactions.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Transactions",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//reports button
class ReportsBttn extends StatefulWidget {
  const ReportsBttn({super.key});

  @override
  State<ReportsBttn> createState() => __ReportsBttnState();
}

class __ReportsBttnState extends State<ReportsBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.reportsPage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/reports.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Reports",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//dispute button
class DisputeBttn extends StatefulWidget {
  const DisputeBttn({super.key});

  @override
  State<DisputeBttn> createState() => __DisputeBttnState();
}

class __DisputeBttnState extends State<DisputeBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.dispute);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/dispute.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Dispute",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//wallet button
class WalletBttn extends StatefulWidget {
  const WalletBttn({super.key});

  @override
  State<WalletBttn> createState() => __WalletBttnState();
}

class __WalletBttnState extends State<WalletBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.requestwalletpage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/wallet.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Wallet",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//communication button
class CommunicationBttn extends StatefulWidget {
  const CommunicationBttn({super.key});

  @override
  State<CommunicationBttn> createState() => __CommunicationBttnState();
}

class __CommunicationBttnState extends State<CommunicationBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(RoutesManager.communicationPage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage(
                        "assets/clare_assets/images/communication.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Communication",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//logout button
class LogoutBttn extends StatefulWidget {
  const LogoutBttn({super.key});

  @override
  State<LogoutBttn> createState() => __LogoutBttnState();
}

class __LogoutBttnState extends State<LogoutBttn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RoutesManager.signInPage);
              },
              child: Row(
                children: <Widget>[
                  const Image(
                    image: AssetImage("assets/clare_assets/images/logout.png"),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  sidemenuText(
                    text: "Logout",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
