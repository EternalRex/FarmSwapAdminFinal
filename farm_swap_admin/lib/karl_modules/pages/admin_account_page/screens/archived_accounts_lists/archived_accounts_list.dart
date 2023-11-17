import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/archived_accounts_lists/widgets/admin_archivedLists_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/archived_accounts_lists/widgets/farmer_archivedLists_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import '../../../../../routes/routes.dart';
import '../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'widgets/consumer_archivedLists_btn.dart';

// ignore: must_be_immutable
class ArchivedAccountLists extends StatefulWidget {
  ArchivedAccountLists({
    super.key,
    this.documentID,
  });
  final String? documentID;
  String selectedId = "";

  @override
  State<ArchivedAccountLists> createState() => _RequestReactivationListsState();
}

class _RequestReactivationListsState extends State<ArchivedAccountLists> {
  final GetAllAdminRequests getAllAdminRequests = GetAllAdminRequests();
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
      body: Row(
        children: [
          /*FIRST EXPANDED THAT WILL CONTAIN ALL THE NAVIGATION */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                /*DECORATING THE CONTAINER */
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
                //this calls the dashboard buttons nga naa tanan side menu button
                child: const DashBoardExpanded1Item(),
              ),
            ),
          ),

          /*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
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
                          .pushNamed(RoutesManager.adminAccount);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Archived Account",
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
                          controller: searchController,
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
                            hintText: 'Search here',
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchValue = searchController.text;
                                });
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xFFDA6317),
                              ),
                            ),
                            prefixIconColor: const Color(0xFFDA6317),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
                          child: Container(
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
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
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 35, top: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Admin Archived Accounts',
                                              style:
                                                  Poppins.contentTitle.copyWith(
                                                color: const Color(0xFF09041B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 600,
                                  child: _buildUserList(),
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
                          horizontal: 10, vertical: 14),
                      child: Row(
                        children: [
                          /*PROFILE TEXT */
                          const SizedBox(
                            width: 82,
                          ),
                          /*MESSAGE BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.envelope,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                          /*NOTIFICATIOIN BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const AdminArchivedListBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const FarmerArchivedListBtn(),
                    const SizedBox(
                      height: 15,
                    ),
                    const ConsumerArchivedListBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('AdminArchivedUsers')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for data.
          return const SizedBox(
            height: 5,
            width: 5,
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView(
              children: snapshot.data!.docs.map<Widget>((document) {
                return _buildUserListItems(document);
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Widget _buildUserListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final profileImage = CachedNetworkImageProvider("${data["profileUrl"]}");
/*Only the specific account searched will display*/
    if (searchValue.isNotEmpty) {
      if (data["First Name"] == searchValue ||
          data["Last Name"] == searchValue ||
          data["Email Address"] == searchValue) {
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
                    SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          //this padding holds the profile image of the admin
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: profileImage,
                              radius: 20,
                            ),
                          ),

                          //this column holds the admin users info
                          //like firstname, lastname and address
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //first column that holds the admin user firstname and username
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "${data["First Name"]} ",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "${data["Last Name"]}",
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //second column that holds the admin user address
                              Text(
                                "${data["Address"]}",
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 240,
                    ),
                    //sizedbox for the button archived
                    //sizedbox for archived button
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Color(0xFFD9D9D9),
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
                                onPressed: () async {},
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'Archived',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
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
                    ),
                  ],
                ),
              ],
            ),
          ), /*When tapping that particular row of user we will send that users id and email
        address to the next screen which is the AsminActual Screen */
        );
      }
    }

    /* else if search bar is empty Check if the documents that we accessed has an eamil that is not simillar to the current users email
    because we will not display the current user here only those other users*/

    else {
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
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        //this padding holds the profile image of the admin
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: profileImage,
                            radius: 20,
                          ),
                        ),

                        //this column holds the admin users info
                        //like firstname, lastname and address
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first column that holds the admin user firstname and username
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "${data["First Name"]} ",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "${data["Last Name"]}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //second column that holds the admin user address
                            Text(
                              "${data["Address"]}",
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 240,
                  ),
                  //sizedbox for the button archived
                  //sizedbox for archived button
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
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
                              onPressed: () async {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Archived',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
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
                  ),
                ],
              ),
            ],
          ),
        ), /*When tapping that particular row of user we will send that users id and email
        address to the next screen which is the AsminActual Screen */
      );
    }

    return Container();
  }
}
