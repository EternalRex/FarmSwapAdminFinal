import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/database/admin/logs_insert_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/update_farmerid_query.dart';
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
import 'package:farm_swap_admin/rollaine_modules/provider/farmer_userId_provider.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FarmerRequestPage extends StatefulWidget {
  FarmerRequestPage({super.key});

  String selectedId = '';

  @override
  State<FarmerRequestPage> createState() => _FarmerRequestPageState();
}

class _FarmerRequestPageState extends State<FarmerRequestPage> {
  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchFarmerController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String farmerSearchValue = '';

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
                    UserLogoSideMenu(),
                    //20 height spacing
                    SizedBox(
                      height: 20,
                    ),

                    //Dashboard icon and label
                    UserDashboardOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    UserAdminAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    UserUserAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    UserListingsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    UserTransactionOptionsBtn(),
                    //15 height spacing
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
                  title: const TitleText(
                    myText: 'Reactivation Request',
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
                    //Expanded for main content
                    Expanded(
                      flex: 5,
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
                                        top: 15,
                                        left: 15,
                                        right: 15,
                                        bottom: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: greenLight,
                                          borderRadius: const BorderRadius.all(
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
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            /*Farmers Title */
                                            Text(
                                              'Farmers',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09051C),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 480,
                                            ),
                                            Text(
                                              'Status',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09051C),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 80,
                                            ),
                                            Text(
                                              'Request',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09051C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: SizedBox(
                                      height: 400,
                                      child: _buildFarmerList(),
                                    ),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }

  //returns a widget for displaying a list of items.
  Widget _buildFarmerList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerUsers')
          .snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .where((document) {
                    // Filter documents where accountStatus is 'REQUESTING'.
                    return document['accountStatus'] == 'Requesting';
                  })
                  .map<Widget>((document) => _buildFarmerListItems(document))
                  .toList(),
            ),
          );
        } else {
          //This is a loading indicator that informs the user that data is being fetched.
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFF14BE77),
              ),
            ),
          );
        }
      },
    );
  }

  //responsible for creating a widget to represent a farmer
  Widget _buildFarmerListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> farmers = document.data() as Map<String, dynamic>;

    //checks if a searchValue variable is not empty
    if (farmerSearchValue.isNotEmpty) {
      //checks whether the searchValue matches any of the farmer's attributes
      if (farmers['firstname'] == farmerSearchValue ||
          farmers['lastname'] == farmerSearchValue ||
          farmers['email'] == farmerSearchValue) {
        //displaying a single row in a list
        return ListTile(
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                //Row where the profile, first name, last name, and details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      //profile of farmer
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            '${farmers['profilePhoto']}'),
                        radius: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${farmers["firstname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${farmers["lastname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    //Status
                    const SizedBox(
                      width: 458,
                    ),
                    //Button for details where you will be redirected to farmer details
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          SizedBox(
                            height: 27,
                            width: 60,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 255, 196, 0),
                                    Color.fromARGB(255, 255, 153, 0),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Requesting',
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
                          ),
                        ],
                      ),
                    ),
                    //Accept button
                    const Spacer(),
                    //Button for details where you will be redirected to farmer details
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          DecoratedBox(
                            decoration: const BoxDecoration(
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                disabledForegroundColor:
                                    Colors.transparent.withOpacity(0.38),
                                disabledBackgroundColor:
                                    Colors.transparent.withOpacity(0.12),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () async {
                                //Update the state of the widget with the selected user's ID
                                setState(() {
                                  widget.selectedId = "${document["userId"]}";
                                });

                                //Uses the Provider package to set the user ID in a state management provider
                                Provider.of<FarmerUserIdProvider>(context,
                                        listen: false)
                                    .setfarmerUserId(widget.selectedId);

                                //Navigates to a different screen
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.detailsFarmerPage);

                                await updateField('Active', widget.selectedId);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Accept',
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
                    //Decline button
                    const SizedBox(width: 10),
                    //Button for details where you will be redirected to farmer details
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Details button
                          DecoratedBox(
                            decoration: const BoxDecoration(
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
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                disabledForegroundColor:
                                    Colors.transparent.withOpacity(0.38),
                                disabledBackgroundColor:
                                    Colors.transparent.withOpacity(0.12),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () async {
                                //Update the state of the widget with the selected user's ID
                                setState(() {
                                  widget.selectedId = "${farmers["userId"]}";
                                });

                                //Uses the Provider package to set the user ID in a state management provider
                                Provider.of<FarmerUserIdProvider>(context,
                                        listen: false)
                                    .setfarmerUserId(widget.selectedId);

                                //Navigates to a different screen
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.detailsFarmerPage);

                                await updateField2(
                                    'Deactivate', widget.selectedId);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Decline',
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
      }
    }
    //certain actions or access is restricted for users whose email doesn't match the email associated with the farmer's data
    else if (FirebaseAuth.instance.currentUser!.email != farmers['email']) {
      return ListTile(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              //Row where the profile, first name, last name, and details
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    //profile of farmer
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          '${farmers['profilePhoto']}'),
                      radius: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  //First name of farmer
                  Text(
                    "${farmers["firstname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  //Last name of farmer
                  Text(
                    "${farmers["lastname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  //Status
                  const SizedBox(
                    width: 458,
                  ),
                  //Button for details where you will be redirected to farmer details
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        SizedBox(
                          height: 27,
                          width: 60,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 255, 196, 0),
                                  Color.fromARGB(255, 255, 153, 0),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Requesting',
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
                        ),
                      ],
                    ),
                  ),
                  //Accept button
                  const Spacer(),
                  //Button for details where you will be redirected to farmer details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        DecoratedBox(
                          decoration: const BoxDecoration(
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              //Update the state of the widget with the selected user's ID
                              setState(() {
                                widget.selectedId = "${document["userId"]}";
                              });

                              //Uses the Provider package to set the user ID in a state management provider
                              Provider.of<FarmerUserIdProvider>(context,
                                      listen: false)
                                  .setfarmerUserId(widget.selectedId);

                              //Navigates to a different screen
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.detailsFarmerPage);

                              await updateField('Active', widget.selectedId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Accept',
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
                  //Decline button
                  const SizedBox(width: 10),
                  //Button for details where you will be redirected to farmer details
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Details button
                        DecoratedBox(
                          decoration: const BoxDecoration(
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              //Update the state of the widget with the selected user's ID
                              setState(() {
                                widget.selectedId = "${farmers["userId"]}";
                              });

                              //Uses the Provider package to set the user ID in a state management provider
                              Provider.of<FarmerUserIdProvider>(context,
                                      listen: false)
                                  .setfarmerUserId(widget.selectedId);

                              //Navigates to a different screen
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.detailsFarmerPage);

                              await updateField2(
                                  'Deactivate', widget.selectedId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Decline',
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
    }
    return Container();
  }

  //Used for fetching the document ID associated with a given user in Firestore.
  UpdateUserId updateUserId = UpdateUserId();

  //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
  final email = FirebaseAuth.instance.currentUser!.email;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  //An instance for logging admin actions.
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();
  Future<void> updateField(String? updatedata, String userid) async {
    //Retrieves the document ID associated with the provided user ID.
    await updateUserId.getUpdateUserId(userid);

    //Creates a reference to a Firestore document inside the 'CustomerUsers' collection.
    final reference = FirebaseFirestore.instance
        .collection('sample_FarmerUsers')
        .doc(updateUserId.docId);

    //Prepares the data that will be updated in the Firestore document.
    final updateData = {
      'accountStatus': updatedata,
    };

    //Log the admin's action.
    adminLogs.createAdminLogs(
        email, userId, "Reactivate_Farmer_Account", DateTime.now());

    try {
      //Attempts to update the Firestore document using the update method.
      await reference.update(updateData);
    } catch (e) {
      print('Error while updating document: $e');
    }
  }

  Future<void> updateField2(String? updatedata, String userid) async {
    //Retrieves the document ID associated with the provided user ID.
    await updateUserId.getUpdateUserId(userid);

    //Creates a reference to a Firestore document inside the 'CustomerUsers' collection.
    final reference = FirebaseFirestore.instance
        .collection('sample_FarmerUsers')
        .doc(updateUserId.docId);

    //Prepares the data that will be updated in the Firestore document.
    final updateData = {
      'accountStatus': updatedata,
    };

    //Log the admin's action.
    adminLogs.createAdminLogs(
        email, userId, "Decline_Reactivation_Farmer", DateTime.now());

    try {
      //Attempts to update the Firestore document using the update method.
      await reference.update(updateData);
    } catch (e) {
      print('Error while updating document: $e');
    }
  }
}
