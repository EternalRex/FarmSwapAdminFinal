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
import 'package:farm_swap_admin/rollaine_modules/provider/customer_userId_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/provider/farmer_userId_provider.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserAccount extends StatefulWidget {
  UserAccount({super.key});

  //Variable na selected id nga String
  String selectedId = '';

  @override
  State<UserAccount> createState() => _UserAccount();
}

class _UserAccount extends State<UserAccount> {
  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchFarmerController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String farmerSearchValue = '';

  //creates an instance of TextEditingController named searchCustomerController.
  TextEditingController searchCustomerController = TextEditingController();
  //used to store the search query entered by the user for searching customers.
  String customerSearchValue = '';

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
                                  Color.fromARGB(255, 255, 196, 0),
                                  Color.fromARGB(255, 255, 153, 0),
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
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
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    RoutesManager.pendingAccountPage);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Pending Accounts',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 12,
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
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),

                                        //Container for search bar
                                        child: SizedBox(
                                          width: 280,
                                          height: 40,
                                          child: TextField(
                                            controller:
                                                searchCustomerController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                farmerSearchValue = query;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(5),
                                              filled: true,
                                              fillColor: const Color(0xFFF9A84D)
                                                  .withOpacity(0.10),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Search',
                                              prefixIcon: const Icon(
                                                  Icons.search_rounded),
                                              prefixIconColor:
                                                  const Color(0xFFDA6317),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
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
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(RoutesManager
                                                          .requestFarmer);
                                                },
                                                child: Text(
                                                  'Farmer Requests',
                                                  style: Poppins.menuTitle
                                                      .copyWith(
                                                    color: greenDark,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
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
                                        child: _buildFarmerList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
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
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),

                                        //Container for search bar
                                        child: SizedBox(
                                          width: 280,
                                          height: 40,
                                          child: TextField(
                                            controller: searchFarmerController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                customerSearchValue = query;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(5),
                                              filled: true,
                                              fillColor: const Color(0xFFF9A84D)
                                                  .withOpacity(0.10),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Search',
                                              prefixIcon: const Icon(
                                                  Icons.search_rounded),
                                              prefixIconColor:
                                                  const Color(0xFFDA6317),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          left: 15,
                                          right: 15,
                                          bottom: 5),
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
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed(RoutesManager
                                                          .requestCustomer);
                                                },
                                                child: Text(
                                                  'Consumer Requests',
                                                  style: Poppins.menuTitle
                                                      .copyWith(
                                                    color: greenDark,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
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
                                        child: _buildCustomerList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
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

  //Farmer

  //returns a widget for displaying a list of items.
  Widget _buildFarmerList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('sample_FarmerUsers').orderBy('registrationDate')
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
                  .where((document) =>
                      document['accountStatus'] != 'PENDING' &&
                      document['accountStatus'] != 'Deactivate' &&
                      document['accountStatus'] != 'Requesting')
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
    Timestamp dateTimestamp = document["registrationDate"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);

    //checks if a searchValue variable is not empty
    if (farmerSearchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = farmerSearchValue.toLowerCase();
      //checks whether the searchValue matches any of the farmer's attributes
      if (farmers['firstname'].toString().toLowerCase() ==
              searchValueLowerCase ||
          farmers['lastname'].toString().toLowerCase() ==
              searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase) {
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
                    //this padding holds the profile image of the customer
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: farmers["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
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
                              onPressed: () {
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
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Details',
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
                  //this padding holds the profile image of the customer
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                      imageUrl: farmers["profilePhoto"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 20,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
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
                            onPressed: () {
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
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Details',
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

  //Consumer

  //returns a widget for displaying a list of items.
  Widget _buildCustomerList() {
    return StreamBuilder<QuerySnapshot>(
      //listens for changes in the collection and update the UI accordingly.
      stream: FirebaseFirestore.instance
          .collection('sample_ConsumerUsers').orderBy('registrationDate')
          .snapshots(),
      //defines what should be displayed based on the data from the stream.
      builder: (context, snapshot) {
        //It ensures that the stream is active and data is available.
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            //displaying a scrollable list of items.
            child: ListView(
              /* We are getting all the list of documents in Firebase, and each document one by one.
           * The documents will be passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .where((document) =>
                      document['accountStatus'] != 'PENDING' &&
                      document['accountStatus'] != 'DEACTIVATED' &&
                      document['accountStatus'] != 'REQUESTING')
                  .map<Widget>((document) => _buildCustomerListItems(document))
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
  Widget _buildCustomerListItems(DocumentSnapshot document) {
    //specifies that the data should be treated as a map with string keys and dynamic values.
    Map<String, dynamic> customer = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["registrationDate"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);

    //checks if a searchValue variable is not empty
    if (customerSearchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = customerSearchValue.toLowerCase();
      //checks whether the searchValue matches any of the customer's attributes
      if (customer['firstname'].toString().toLowerCase() ==
              searchValueLowerCase ||
          customer['lastname'].toString().toLowerCase() ==
              searchValueLowerCase ||
          customer['accountStatus'].toString().toLowerCase() ==
              searchValueLowerCase ||
          customer['email'].toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase) {
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
                    //this padding holds the profile image of the customer
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: //this will display the users profile picture in each listtile
                          CachedNetworkImage(
                        imageUrl: customer["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),

                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${customer["firstname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${customer["lastname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
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
                              onPressed: () {
                                //Update the state of the widget with the selected user's ID
                                setState(() {
                                  widget.selectedId = "${customer["userId"]}";
                                });

                                //Uses the Provider package to set the user ID in a state management provider
                                Provider.of<CustomerUserIdProvider>(context,
                                        listen: false)
                                    .setcustomerUserId(widget.selectedId);

                                //Navigates to a different screen
                                Navigator.of(context).pushNamed(
                                    RoutesManager.detailsCustomerPage);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Details',
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
    else if (FirebaseAuth.instance.currentUser!.email != customer['email']) {
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
                  //this padding holds the profile image of the customer
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                      imageUrl: customer["profilePhoto"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 20,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),

                  const SizedBox(
                    width: 8,
                  ),
                  //First name of farmer
                  Text(
                    "${customer["firstname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  //Last name of farmer
                  Text(
                    "${customer["lastname"]}",
                    style: Poppins.farmerName.copyWith(
                      color: const Color(0xFF09051B),
                    ),
                  ),
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
                            onPressed: () {
                              //Update the state of the widget with the selected user's ID
                              setState(() {
                                widget.selectedId = "${customer["userId"]}";
                              });

                              //Uses the Provider package to set the user ID in a state management provider
                              Provider.of<CustomerUserIdProvider>(context,
                                      listen: false)
                                  .setcustomerUserId(widget.selectedId);

                              //Navigates to a different screen
                              Navigator.of(context)
                                  .pushNamed(RoutesManager.detailsCustomerPage);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Details',
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
}
