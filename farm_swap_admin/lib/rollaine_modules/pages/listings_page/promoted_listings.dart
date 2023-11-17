import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/screens/promotedbarter_details_wrapper.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/screens/promotedsell_details_wrapper.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsLogo/listings_logo.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_admin_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_communication_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dashboard_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_dispute_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_listings_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_logout_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_reports.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_transactions.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_user_account_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/ListingsSideMenu_btns/listings_wallet_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/widgets/Text/title_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PromotedListings extends StatefulWidget {
  const PromotedListings({super.key});

  @override
  State<PromotedListings> createState() => _PromotedListingsState();
}

class _PromotedListingsState extends State<PromotedListings> {
  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchBarterController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String searchBarterValue = '';

  //creates an instance of TextEditingController named searchFarmerController.
  TextEditingController searchSellController = TextEditingController();
  //store the search query entered by the user for searching farmers.
  String searchSellValue = '';

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
                    ListingsLogoSideMenu(),
                    //15 height spacing
                    SizedBox(
                      height: 25,
                    ),

                    //Dashboard icon and label
                    ListingsDashboardOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Admin Account icon and label
                    ListingsAdminAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //User Account icon and label
                    ListingsUserAccountOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Listings icon and label
                    ListingsListingsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Transactions icon and label
                    ListingsTransactionsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Reports icon and label
                    ListingsReportsOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Dispute icon and label
                    ListingsDisputeOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Wallet icon and label
                    ListingsWalletOptionsBtn(),
                    //15 height spacing
                    SizedBox(
                      height: 15,
                    ),

                    //Communication icon and label
                    ListingsCommunicationOptionsBtn(),
                    Spacer(),

                    //Logout icon and label
                    ListingsLogoutOptionsBtn(),
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
                          .pushNamed(RoutesManager.listingsPage);
                    },
                  ),
                  //Design the page title
                  title: const TitleText(
                    myText: 'Promoted Listings',
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
                                  Color.fromARGB(255, 250, 175, 0),
                                  Color.fromARGB(255, 255, 128, 0),
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
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.archivedListings);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Archived Listings',
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
                                            controller: searchBarterController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                searchBarterValue = query;
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
                                                'Promoted Products for Barter',
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
                                        child: _buildBarterPromotedList(),
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
                                            controller: searchSellController,
                                            style: GoogleFonts.poppins(
                                                color: const Color(0xFFDA6317),
                                                height: 1.5),
                                            onSubmitted: (String query) {
                                              setState(() {
                                                searchSellValue = query;
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
                                                'Promoted Products for Selling',
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
                                        child: _buildSellPromotedList(),
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget _buildBarterPromotedList() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collectionGroup('barter').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs
                    .where((document) => document['promoted'] == true)
                    .map<Widget>(
                        (document) => _buildBarterPromotedListItems(document))
                    .toList(),
              ),
            );
          }
        }
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Color(0xFF14BE77),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBarterPromotedListItems(QueryDocumentSnapshot document) {
    Map<String, dynamic> barter = document.data() as Map<String, dynamic>;

    /*Date Conversions of listing start date*/
    Timestamp timestamp1 = barter["listingStartTime"];
    DateTime dateTime1 = timestamp1.toDate();
    String finalStartDate = DateFormat('yyyy-MM-dd').format(dateTime1);

    /*Date Conversions of listing end date */
    Timestamp timestamp2 = barter["listingEndTime"];
    DateTime dateTime2 = timestamp2.toDate();
    String finalEndDate = DateFormat('yyyy-MM-dd').format(dateTime2);

    /*Firebase data assigned to variables for easy use */
    String imageUrl = barter["listingpictureUrl"];
    String listingname = barter["listingName"];
    String listingPrice = barter["listingprice"].toString();
    String listingQuan = barter['listingQuantity'].toString();
    String listingStatus = barter["listingstatus"];
    String prefItem = barter["prefferedItem"];
    bool promoted = barter["promoted"];
    String listingCategory = barter["listingcategory"];
    String listingDisc = barter["listingdiscription"];
    String farmerId = barter["farmerId"];
    String farmerName = barter["farmerFname"];
    String farmerLname = barter["farmerLname"];
    String farmerMunicipality = barter["farmerMunicipality"];
    String farmerBarangay = barter["farmerBaranggay"];
    String farmerUsername = barter["farmerUserName"];

    if (searchBarterValue.isNotEmpty) {
      if (barter["listingName"] == searchBarterValue ||
          barter["farmerFname"] == searchBarterValue ||
          barter["farmerLname"] == searchBarterValue) {
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
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    listingname,
                                    style: Poppins.farmerName.copyWith(
                                        color: const Color(0xFF09051B)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '$listingQuan kilograms',
                                    style: Poppins.userName.copyWith(
                                        color: const Color(0xFF09051B)),
                                  ),
                                ),
                                Text(
                                  '$listingPrice equiv. value',
                                  style: Poppins.contentText
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BarterPromotedDetails(
                                  url: imageUrl,
                                  name: listingname,
                                  disc: listingDisc,
                                  price: listingPrice,
                                  quantity: listingQuan,
                                  status: listingStatus,
                                  prefItem: prefItem,
                                  promoted: promoted,
                                  category: listingCategory,
                                  start: finalStartDate,
                                  end: finalEndDate,
                                  farmerid: farmerId,
                                  fname: farmerName,
                                  fLname: farmerLname,
                                  fUname: farmerUsername,
                                  fmunicipal: farmerMunicipality,
                                  fbarangay: farmerBarangay,
                                );
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.read_more_rounded,
                          color: greenNormal,
                        ),
                        iconSize: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    } else {
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(imageUrl),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  listingname,
                                  style: Poppins.farmerName
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '$listingQuan kilograms',
                                  style: Poppins.userName
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ),
                              Text(
                                '$listingPrice equiv. value',
                                style: Poppins.contentText
                                    .copyWith(color: const Color(0xFF09051B)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BarterPromotedDetails(
                                url: imageUrl,
                                name: listingname,
                                disc: listingDisc,
                                price: listingPrice,
                                quantity: listingQuan,
                                status: listingStatus,
                                prefItem: prefItem,
                                promoted: promoted,
                                category: listingCategory,
                                start: finalStartDate,
                                end: finalEndDate,
                                farmerid: farmerId,
                                fname: farmerName,
                                fLname: farmerLname,
                                fUname: farmerUsername,
                                fmunicipal: farmerMunicipality,
                                fbarangay: farmerBarangay,
                              );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.read_more_rounded,
                        color: greenNormal,
                      ),
                      iconSize: 35,
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

  //Selling

  Widget _buildSellPromotedList() {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collectionGroup('sell').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs
                    .where((document) => document['promoted'] == true)
                    .map<Widget>(
                        (document) => _buildSellPromotedListItems(document))
                    .toList(),
              ),
            );
          }
        }
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Color(0xFF14BE77),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSellPromotedListItems(QueryDocumentSnapshot document) {
    Map<String, dynamic> sell = document.data() as Map<String, dynamic>;

    /*Date Conversions of listing start date*/
    Timestamp timestamp1 = sell["listingStartTime"];
    DateTime dateTime1 = timestamp1.toDate();
    String finalStartDate = DateFormat('yyyy-MM-dd').format(dateTime1);

    /*Date Conversions of listing end date */
    Timestamp timestamp2 = sell["listingEndTime"];
    DateTime dateTime2 = timestamp2.toDate();
    String finalEndDate = DateFormat('yyyy-MM-dd').format(dateTime2);

    /*Firebase data assigned to variables for easy use */
    String imageUrl = sell["listingpictureUrl"];
    String listingname = sell["listingName"];
    String listingPrice = sell["listingprice"].toString();
    String listingQuan = sell["listingQuantity"].toString();
    String listingStatus = sell["listingstatus"];
    bool promoted = sell["promoted"];
    String listingCategory = sell["listingcategory"];
    String listingDisc = sell["listingdiscription"];
    String farmerId = sell["farmerId"];
    String farmerName = sell["farmerFname"];
    String farmerLname = sell["farmerLname"];
    String farmerMunicipality = sell["farmerMunicipality"];
    String farmerBarangay = sell["farmerBaranggay"];
    String farmerUsername = sell["farmerUserName"];

    if (searchSellValue.isNotEmpty) {
      if (sell["listingName"] == searchSellValue ||
          sell["farmerFname"] == searchSellValue ||
          sell["farmerLname"] == searchSellValue) {
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
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    listingname,
                                    style: Poppins.farmerName.copyWith(
                                        color: const Color(0xFF09051B)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '$listingQuan kilograms',
                                    style: Poppins.userName.copyWith(
                                        color: const Color(0xFF09051B)),
                                  ),
                                ),
                                Text(
                                  '$listingPrice equiv. value',
                                  style: Poppins.contentText
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SellPromotedDetails(
                                  url: imageUrl,
                                  name: listingname,
                                  disc: listingDisc,
                                  price: listingPrice,
                                  quantity: listingQuan,
                                  status: listingStatus,
                                  promoted: promoted,
                                  category: listingCategory,
                                  start: finalStartDate,
                                  end: finalEndDate,
                                  farmerid: farmerId,
                                  fname: farmerName,
                                  fLname: farmerLname,
                                  fUname: farmerUsername,
                                  fmunicipal: farmerMunicipality,
                                  fbarangay: farmerBarangay,
                                );
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.read_more_rounded,
                          color: greenNormal,
                        ),
                        iconSize: 35,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    } else {
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
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(imageUrl),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  listingname,
                                  style: Poppins.farmerName
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '$listingQuan kilograms',
                                  style: Poppins.userName
                                      .copyWith(color: const Color(0xFF09051B)),
                                ),
                              ),
                              Text(
                                '$listingPrice equiv. value',
                                style: Poppins.contentText
                                    .copyWith(color: const Color(0xFF09051B)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SellPromotedDetails(
                                url: imageUrl,
                                name: listingname,
                                disc: listingDisc,
                                price: listingPrice,
                                quantity: listingQuan,
                                status: listingStatus,
                                promoted: promoted,
                                category: listingCategory,
                                start: finalStartDate,
                                end: finalEndDate,
                                farmerid: farmerId,
                                fname: farmerName,
                                fLname: farmerLname,
                                fUname: farmerUsername,
                                fmunicipal: farmerMunicipality,
                                fbarangay: farmerBarangay,
                              );
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.read_more_rounded,
                        color: greenNormal,
                      ),
                      iconSize: 35,
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
