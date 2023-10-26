import 'package:flutter/material.dart';
import '../widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import '../widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';

class DashBoardExpanded1Item extends StatefulWidget {
  const DashBoardExpanded1Item({super.key});

  @override
  State<DashBoardExpanded1Item> createState() => _DashBoardExpanded1ItemState();
}

class _DashBoardExpanded1ItemState extends State<DashBoardExpanded1Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: 10,
        ),
        /*THIS ROW WILL CONTAIN THE lOGOUT ICON AND LABEL */
        DashLogoutOptionBtn(),
      ],
    );
  }
}
