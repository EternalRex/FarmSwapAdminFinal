import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/customers/customer_account_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/farmer_account_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/consumers/customer_account_wrapper.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/farmers/farmer_account_wrapper.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/title_text.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserLogo/user_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_reports_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_transactions_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserSideMenu_btns/user_wallet_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccount();
}

class _UserAccount extends State<UserAccount> {
  final RetrieveFarmerAccounts retrieveFarmerAccounts =
      RetrieveFarmerAccounts();
  final RetrieveCustomerAccounts retrieveCustomerAccounts =
      RetrieveCustomerAccounts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //First expanded division of a row where the navigation options can be seen
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                //Designing the container of the side menu
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

                //Column in which there is the navigation options, the logo, logo name, and slogan
                child: const Column(
                  children: [
                    //Row for the logo, name, and slogan
                    UserLogoSideMenu(),
                    //15 height for spacing
                    SizedBox(
                      height: 20,
                    ),

                    //Dashboard icon and label
                    UserDashboardOptionsBtn(),
                    //15 height for spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    UserAdminAccountOptionsBtn(),
                    //15 height for spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    UserUserAccountOptionsBtn(),
                    //15 height for spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    UserListingsOptionsBtn(),
                    //15 height for spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    UserTransactionOptionsBtn(),
                    //15 height for spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    UserReportsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    UserDisputeOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    UserWalletOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    UserCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    UserLogoutOptionsBtn(),
                  ],
                ),
              ),
            ),
          ),

          //Second expanded division that contains the content
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  //Design the page title
                  title: const TitleText(
                    myText: 'User Account',
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
                      flex: 2,
                      child: Padding(
                        //Decorate the expanded area for the main content
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                          //Design of the container
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
                          //Title for the expanded kung asa masud ang maretrieve na users specifically sa farmers na side
                          child: Column(
                            children: [
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15),
                                    child: Row(
                                      children: [
                                        Text('Farmers',
                                            style: Poppins.contentTitle
                                                .copyWith(
                                                    color: const Color(
                                                        0xFF09051C))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  //Mao ni na part sa code kung asa siya ang mo tawag sa mga na register na farmers sa application
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FutureBuilder(
                                        future:
                                            retrieveFarmerAccounts.getDocsId(),
                                        builder: (context, snapshot) {
                                          return Column(
                                            children: retrieveFarmerAccounts
                                                .documentId
                                                .map((documentId) {
                                              return ListTile(
                                                title: ReadFarmerAccount(
                                                    documentId: documentId),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        //Decorate the expanded area for the main content
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
                          //Design of the container
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
                          //Title for the expanded kung asa masud ang maretrieve na users specifically sa consumers na side
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Row(
                                        children: [
                                          Text('Consumers',
                                              style: Poppins.contentTitle
                                                  .copyWith(
                                                      color: const Color(
                                                          0xFF09051C))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    //Mao ni na part sa code kung asa siya ang mo tawag sa mga na register na consumers sa application
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        FutureBuilder(
                                          future: retrieveCustomerAccounts
                                              .getDocsId(),
                                          builder: (context, snapshot) {
                                            return Column(
                                              children: retrieveCustomerAccounts
                                                  .documentId
                                                  .map((documentId) {
                                                return ListTile(
                                                  title: ReadCustomerAccount(
                                                      documentId: documentId),
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                      ],
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
        ],
      ),
    );
  }
}
