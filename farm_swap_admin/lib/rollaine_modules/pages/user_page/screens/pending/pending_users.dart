import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
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
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingUserAccounts extends StatefulWidget {
  const PendingUserAccounts({super.key});

  @override
  State<PendingUserAccounts> createState() => _PendingUserAccountsState();
}

class _PendingUserAccountsState extends State<PendingUserAccounts> {
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
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFFDA6317),
                      ),
                      splashColor: const Color(0xFFF9A84D),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RoutesManager.userAccountPage);
                      },
                    ),
                    //Design the page title
                    title: const TitleText(
                      myText: 'Pending Accounts',
                      myColor: Color(0xFF09041B),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                  ),
                  body: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
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
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 15,
                                          right: 15,
                                          bottom: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: greenLight,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: shadow,
                                                blurRadius: 2,
                                                offset: const Offset(0, 1),
                                              )
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              /*Farmers Title */
                                              Text(
                                                'Farmers',
                                                style: Poppins.contentTitle
                                                    .copyWith(
                                                  color:
                                                      const Color(0xFF09051C),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: SizedBox(
                                        height: 390,
                                        child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('sample_FarmerUsers')
                                              .where('accountStatus',
                                                  isEqualTo: 'PENDING')
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.active) {
                                              if (snapshot.hasData) {
                                                final pendingFarmers =
                                                    snapshot.data!.docs;
                                                return ListView.builder(
                                                  itemCount:
                                                      pendingFarmers.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final farmers =
                                                        pendingFarmers[index];
                                                    return ListTile(
                                                      title: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(10),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: shadow,
                                                              blurRadius: 2,
                                                              offset:
                                                                  const Offset(
                                                                      0, 1),
                                                            ),
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            //Row where the profile, first name, last name, and details
                                                            Row(
                                                              children: [
                                                                //this padding holds the profile image of the customer
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          5.0),
                                                                  child: //this will display the users profile picture in each listtile
                                                                      CachedNetworkImage(
                                                                    imageUrl: farmers[
                                                                            "profilePhoto"] ??
                                                                        "", // Provide a default empty string if it's null
                                                                    imageBuilder:
                                                                        (context,
                                                                                imageProvider) =>
                                                                            CircleAvatar(
                                                                      backgroundImage:
                                                                          imageProvider,
                                                                      radius:
                                                                          20,
                                                                    ),
                                                                    placeholder:
                                                                        (context,
                                                                                url) =>
                                                                            const CircularProgressIndicator(),
                                                                    errorWidget:
                                                                        (context,
                                                                            url,
                                                                            error) {
                                                                      return const Icon(
                                                                          Icons
                                                                              .error);
                                                                    },
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                //First name of farmer
                                                                Text(
                                                                  "${farmers["firstname"]}",
                                                                  style: Poppins
                                                                      .farmerName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09051B),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 3,
                                                                ),
                                                                //Last name of farmer
                                                                Text(
                                                                  "${farmers["lastname"]}",
                                                                  style: Poppins
                                                                      .farmerName
                                                                      .copyWith(
                                                                    color: const Color(
                                                                        0xFF09051B),
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                //Button for details where you will be redirected to farmer details
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      //Details button
                                                                      DecoratedBox(
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            begin:
                                                                                Alignment.topLeft,
                                                                            end:
                                                                                Alignment.bottomRight,
                                                                            colors: [
                                                                              Color(0xFF53E78B),
                                                                              Color(0xFF14BE77),
                                                                            ],
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(17.50),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            disabledForegroundColor:
                                                                                Colors.transparent.withOpacity(0.38),
                                                                            disabledBackgroundColor:
                                                                                Colors.transparent.withOpacity(0.12),
                                                                            shadowColor:
                                                                                Colors.transparent,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            FirebaseFirestore.instance.collection('sample_FarmerUsers').doc(farmers.id).update({
                                                                              'accountStatus': 'Active'
                                                                            }).then(
                                                                              (value) {
                                                                                Navigator.pushReplacementNamed(context, RoutesManager.userAccountPage);
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 5, bottom: 5),
                                                                            child:
                                                                                Text(
                                                                              'Activate',
                                                                              style: GoogleFonts.poppins(
                                                                                color: Colors.white,
                                                                                fontSize: 8,
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.50,
                                                                              ),
                                                                            ),
                                                                          ),
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
                                                    );
                                                  },
                                                );
                                              } else {
                                                return Text(
                                                  'No pending farmer accounts',
                                                  style: Poppins.contentTitle
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09051C),
                                                  ),
                                                );
                                              }
                                            } else {
                                              return const Center(
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Color(
                                                              0xFF14BE77)),
                                                ),
                                              );
                                            }
                                          },
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
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
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
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 15,
                                            right: 15,
                                            bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: greenLight,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: shadow,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 1),
                                                )
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                /*Farmers Title */
                                                Text(
                                                  'Consumers',
                                                  style: Poppins.contentTitle
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09051C),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: SizedBox(
                                          height: 390,
                                          child: SizedBox(
                                            height: 390,
                                            child: StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection(
                                                      'sample_ConsumerUsers')
                                                  .where('accountStatus',
                                                      isEqualTo: 'PENDING')
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.active) {
                                                  if (snapshot.hasData) {
                                                    final pendingFarmers =
                                                        snapshot.data!.docs;
                                                    return ListView.builder(
                                                      itemCount:
                                                          pendingFarmers.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final consumer =
                                                            pendingFarmers[
                                                                index];
                                                        return ListTile(
                                                          title: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: shadow,
                                                                  blurRadius: 2,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 1),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                //Row where the profile, first name, last name, and details
                                                                Row(
                                                                  children: [
                                                                    //this padding holds the profile image of the customer
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          5.0),
                                                                      child: //this will display the users profile picture in each listtile
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            consumer["profilePhoto"] ??
                                                                                "", // Provide a default empty string if it's null
                                                                        imageBuilder:
                                                                            (context, imageProvider) =>
                                                                                CircleAvatar(
                                                                          backgroundImage:
                                                                              imageProvider,
                                                                          radius:
                                                                              20,
                                                                        ),
                                                                        placeholder:
                                                                            (context, url) =>
                                                                                const CircularProgressIndicator(),
                                                                        errorWidget: (context,
                                                                            url,
                                                                            error) {
                                                                          return const Icon(
                                                                              Icons.error);
                                                                        },
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    //First name of farmer
                                                                    Text(
                                                                      "${consumer["firstname"]}",
                                                                      style: Poppins
                                                                          .farmerName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09051B),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 3,
                                                                    ),
                                                                    //Last name of farmer
                                                                    Text(
                                                                      "${consumer["lastname"]}",
                                                                      style: Poppins
                                                                          .farmerName
                                                                          .copyWith(
                                                                        color: const Color(
                                                                            0xFF09051B),
                                                                      ),
                                                                    ),
                                                                    const Spacer(),
                                                                    //Button for details where you will be redirected to farmer details
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          //Details button
                                                                          DecoratedBox(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                begin: Alignment.topLeft,
                                                                                end: Alignment.bottomRight,
                                                                                colors: [
                                                                                  Color(0xFF53E78B),
                                                                                  Color(0xFF14BE77),
                                                                                ],
                                                                              ),
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(17.50),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                backgroundColor: Colors.transparent,
                                                                                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                                                                                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                                                                                shadowColor: Colors.transparent,
                                                                              ),
                                                                              onPressed: () {
                                                                                FirebaseFirestore.instance.collection('sample_ConsumerUsers').doc(consumer.id).update({
                                                                                  'accountStatus': 'Active'
                                                                                }).then(
                                                                                  (value) {
                                                                                    Navigator.pushReplacementNamed(context, RoutesManager.userAccountPage);
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(top: 5, bottom: 5),
                                                                                child: Text(
                                                                                  'Activate',
                                                                                  style: GoogleFonts.poppins(
                                                                                    color: Colors.white,
                                                                                    fontSize: 8,
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.50,
                                                                                  ),
                                                                                ),
                                                                              ),
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
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    return Text(
                                                      'No pending consumer accounts',
                                                      style: Poppins
                                                          .contentTitle
                                                          .copyWith(
                                                        color: const Color(
                                                            0xFF09051C),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  return const Center(
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child:
                                                          CircularProgressIndicator(
                                                              color: Color(
                                                                  0xFF14BE77)),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
