import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/update_farmerid_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/right_user_text.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserRightMenu_btns/user_archive_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/UserRightMenu_btns/user_deduction_btn.dart';
import 'package:farm_swap_admin/rollaine_modules/provider/farmer_userId_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/farmer_userid_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/farmers/farmer_details_wrapper.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailsFarmerPage extends StatefulWidget {
  DetailsFarmerPage({super.key});

    //Declares a variable
    String selectedId = '';

  @override
  State<DetailsFarmerPage> createState() => _DetailsFarmerPageState();
}

class _DetailsFarmerPageState extends State<DetailsFarmerPage> {

  //Creates an instance of the RetrieveFarmerUserId class and makes it accessible through the retrieveCFarmerUserId variable
  final RetrieveFarmerUserId retrieveFarmerUserId = RetrieveFarmerUserId();

  @override
  Widget build(BuildContext context) {

    //Retrieves the farmer user's ID from a state management provider (FarmerUserIdProvider) using the Provider package
    String farmerUserId =
        Provider.of<FarmerUserIdProvider>(context, listen: false)
            .getFarmerUserId();

    return Scaffold(
      body: Row(
        children: [
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
          //Expanded kung asa naa ang content sa users which is ang farmers ug consumers
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Scaffold(
                appBar: AppBar(
                  //arrow button para mabalik siya sa home page sa user account
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
                  //title sa page
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 15),
                        child: Container(
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 25),
                                      //Row kung asa ang title sa content below ane
                                      child: Row(
                                        children: [
                                          Text('Profile',
                                              style: Poppins.contentTitle
                                                  .copyWith(
                                                      color: const Color(
                                                          0xFF09051C))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    //Column kung asa ma show na area ang mga gi retrieve na details gikan sa farmers
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        /*manage an asynchronous operation (data retrieval) and update the 
                                        user interface based on the result of that operation*/
                                        FutureBuilder(
                                          future: retrieveFarmerUserId
                                              .getDocsId(farmerUserId),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              String data = snapshot.data!;
                                              return ReadFarmerDetails(
                                                  documentId: data);
                                            } else {
                                              return const Text('Loading');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
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
          /*THIRD EXPANDED THAT WILL HOLD THE EDIT PROFILE */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*COLUMN THAT WILL CONTAIN EVERY ITEM OF THIS EXPANDED */
                child: Column(
                  children: [
                    /*FIRST ROW OF THE COLUMN THAT WILL HOLD THE PROFILE LABEL, THE MESSAGE 
                    AND THE NOTIFICATION ICON*/
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 14),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 75, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /*MESSAGE BUTTON */
                            SizedBox(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/rollaine_assets/icons/chat.png'),
                                iconSize: 23,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            /*NOTIFICATIOIN BUTTON */
                            SizedBox(
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/rollaine_assets/icons/notification.png'),
                                iconSize: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const UserArchiveOptionsBtn(),
                    const SizedBox(
                      height: 25,
                    ),

                    //Deactivate Button
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () async {

                                //The setState method is used to update the widget.selectedId property.
                                setState(() {
                                  widget.selectedId = farmerUserId;
                                });

                                //The Provider is used to set the farmerUserId in a provider.
                                Provider.of<FarmerUserIdProvider>(context, listen: false).setfarmerUserId(widget.selectedId);

                                //An updateField function is called with the parameters 'Deactivate' and widget.selectedId.
                                await updateField('Deactivate', widget.selectedId);

                                //The code navigates to a new page.
                                Navigator.of(context).pushNamed(RoutesManager.detailsFarmerPage);
                              },
                              child: const RightUserText(
                                myText: 'Deactivate',
                                myColor: Color(0xFF09041B),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Image(
                              image: AssetImage(
                                  'assets/rollaine_assets/icons/block.png'),
                              height: 23,
                              width: 23,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const UserDeductOptionsBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Used for retrieving the document ID for a user based on their ID in Firestore.
  UpdateUserId updateUserId = UpdateUserId();

  //These lines fetch the email and user ID of the currently authenticated user using Firebase Authentication.
  final email = FirebaseAuth.instance.currentUser!.email;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  //An instance for logging admin actions.
   AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();
   Future<void> updateField(String? updatedata, String userid) async {
    
    //Fetch the document ID associated with the provided user ID.
    await updateUserId.getUpdateUserId(userid);

    //Creates a reference to a Firestore document using the retrieved docId.
    final reference = FirebaseFirestore.instance.collection('FarmerUsers').doc(updateUserId.docId);

    //It prepares the data to update in the Firestore document.
    final updateData = {
      'accountStatus': updatedata,
    };

    //To log the admin's action of deactivating a farmer account.
    adminLogs.createAdminLogs(email, userId, "Deactivate_Farmer_Account", DateTime.now());

    try {

      //Attempts to update the Firestore document using the update method.
      await reference.update(updateData);
    } catch (e) {
      print('Error while updating document: $e');
    }
   }
}
