import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsLogo/reports_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_adminlogs_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_barter_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_chat_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_notification_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_number_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_platform_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_revenue_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsRightMenu_btns/reports_selling_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_reports_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_transactions_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/ReportsSideMenu_btns/reports_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/widgets/Text/title_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SellTransDetails extends StatefulWidget {
  SellTransDetails(
      {super.key,
      required this.addamount,
      required this.cbarangay,
      required this.clname,
      required this.cmunicipal,
      required this.cname,
      required this.curl,
      required this.cuname,
      required this.deductfarm,
      required this.fbarangay,
      required this.flname,
      required this.fmunicipal,
      required this.fname,
      required this.furl,
      required this.funame,
      required this.listname,
      required this.listprice,
      required this.listquan,
      required this.liststats,
      required this.listurl,
      required this.price,
      required this.quan,
      required this.time,
      required this.date});

  String addamount;
  String cbarangay;
  String clname;
  String cmunicipal;
  String cname;
  String curl;
  String cuname;
  String deductfarm;
  String fbarangay;
  String flname;
  String fmunicipal;
  String fname;
  String furl;
  String funame;
  String listname;
  String listprice;
  String listquan;
  String liststats;
  String listurl;
  String price;
  String quan;
  String time;
  String date;

  @override
  State<SellTransDetails> createState() => _SellTransDetailsState();
}

class _SellTransDetailsState extends State<SellTransDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //First expanded division of a row
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                //Designing the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),

                  //Box shadow of the container
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),

                //Column in which there is the navigation options
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    ReportsLogoSideMenu(),
                    SizedBox(
                      height: 25,
                    ),

                    //Dashboard icon and label
                    ReportsDashboardOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    ReportsAdminAccountOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    ReportsUserAccountOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    ReportsListingsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    ReportsTransactionsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    ReportsReportsOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    ReportsDisputeOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    ReportsWalletOptionsBtn(),
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    ReportsCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    ReportsLogoutOptionsBtn(),
                  ],
                ),
              ),
            ),
          ),

          //Second expanded division that contains the content
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
                      Navigator.of(context)
                          .pushNamed(RoutesManager.sellingPage);
                    },
                  ),
                  //Design the page title
                  title: const TitleText(
                    myText: 'Selling Transaction Details',
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
                            left: 10, right: 10, bottom: 15),
                        child: SingleChildScrollView(
                          child: Container(
                            height: 510,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              //Box shadow of container
                              boxShadow: [
                                BoxShadow(
                                  color: shadow,
                                  blurRadius: 2,
                                  offset: const Offset(1, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      height: 490,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        //Box shadow of container
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
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Container(
                                                        height: 90,
                                                        width: 140,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                CachedNetworkImageProvider(
                                                                    widget
                                                                        .listurl),
                                                            fit: BoxFit.cover,                                                         ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Product:',
                                                            style: Poppins
                                                                .contentTitle
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget.listname,
                                                            style: Poppins
                                                                .contentTitle
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Product Value:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '₱'
                                                            ' '
                                                            '${widget.listprice}',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Quantity:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.listquan}' ' ' 'kg/s',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Status:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget.liststats,
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Farmer:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.fname}'
                                                            ' '
                                                            '${widget.flname}'
                                                            '  '
                                                            '(${widget.funame})',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Location:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.fbarangay},'
                                                            '  '
                                                            '${widget.fmunicipal}',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Deduction:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.deductfarm}' ' ' 'sc/s',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Added Swap Coins:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '₱'
                                                            ' '
                                                            '${widget.addamount}',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Date of Transaction:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget.date,
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Container(
                                      height: 490,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                        //Box shadow of container
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
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15),
                                                      child: Container(
                                                        height: 90,
                                                        width: 140,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                CachedNetworkImageProvider(
                                                                    widget
                                                                        .curl),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Consumer:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.cname}' ' '
                                                            '${widget.clname}' '  '
                                                            '(${widget.cuname})',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Location:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${widget.cbarangay},' '  '
                                                            '${widget.cmunicipal}',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Purchase Quantity:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget.quan,
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Price:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '₱' ' ' '${widget.price}',
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Purchase Date:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color:
                                                                  greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget
                                                                .time,
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Date of Transaction:',
                                                            style: Poppins
                                                                .discText
                                                                .copyWith(
                                                              color: greenDark,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            widget.date,
                                                            style: Poppins
                                                                .contentText
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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

          //Third expanded division which contains the navigation options of the reports page
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                //Designing the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),

                  //Box shadow of the container
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),

                //Column for the chat and notification buttons
                child: const Column(
                  children: [
                    //Row for the buttons
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 14),
                      child: Padding(
                        padding: EdgeInsets.only(left: 75, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Chat button
                            ReportsChatOptionsBtn(),
                            SizedBox(
                              width: 5,
                            ),
                            //Notification button
                            ReportsNotificationOptionsBtn(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),

                    //Platform icon and label
                    ReportsRevenueOptionsBtn(),
                    SizedBox(
                      height: 25,
                    ),

                    //Platform icon and label
                    ReportsPlatformOptionsBtn(),
                    SizedBox(
                      height: 25,
                    ),

                    //Barter icon and label
                    ReportsBarterOptionsBtn(),
                    SizedBox(
                      height: 25,
                    ),

                    //Selling icon and label
                    ReportsSellingOptionsBtn(),
                    SizedBox(
                      height: 25,
                    ),

                    //Number of users icon and label
                    ReportsNumberOptionsBtn(),
                    SizedBox(
                      height: 25,
                    ),

                    //Admin logs icon and label
                    ReportsAdminLogsOptionsBtn(),
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
