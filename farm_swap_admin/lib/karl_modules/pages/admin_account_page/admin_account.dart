// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/Colors/colors.dart';
import '../dashboard_page/dashboard_query/dashboard_profileInfo.dart';
import '../dashboard_page/dashboard_query/dashboard_query.dart';
import '../dashboard_page/screens/dashboard_epxanded1_items.dart';
import '../dashboard_page/widgets/dshb_buttons_widgets/dashboard_edit_admin_profile_btn.dart';
import '../dashboard_page/widgets/dshb_buttons_widgets/dashboard_recent_activities_btn.dart';
import '../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'screens/admin_account_logs/provider/adminlogs_provider.dart';
import 'screens/admin_user_details/drop_down_update/update_retrieve_docID.dart';
import 'screens/admin_user_details/provider/admin_details_provider.dart';
import 'widgets/archived_button.dart';

// ignore: must_be_immutable
class AdminAccount extends StatefulWidget {
  AdminAccount({
    super.key,
  });
  String selectedId = "";

  @override
  State<AdminAccount> createState() => _AdminAccount();
}

class _AdminAccount extends State<AdminAccount> {
  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
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
                  title: const DashBoardTitleText(
                    myText: "Admin Account",
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
                                      child: Row(
                                        children: [
                                          //this padding holds the content title
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 35, top: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Admin Users',
                                                  style: Poppins.contentTitle
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF09041B),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 515,
                                                ),
                                                //this textbutton will navigate to request reactivation page
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(RoutesManager
                                                            .requestreactivation);
                                                  },
                                                  child: const Text(
                                                    "Requests",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: poppins,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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

          /*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
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
                          const SizedBox(
                            width: 5,
                          ),
                          /*PROFILE TEXT */
                          DashBoardTxt(
                            myText: "Profile",
                            myColor: const Color(0xFF09041B),
                            mySize: 15,
                            myFont: GoogleFonts.poppins().fontFamily,
                            myWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            width: 34,
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
                      height: 25,
                    ),

                    /*SECOND ROW THAT WILL CONTAIN THE PROFILE PICTURE AND ID */

                    /*In this future builder we will get the document id that we get from
                    the database querry in the dashboardquery file */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*We call the profilephoto class from ourr dashboard profileinfo and then
                                pass the variable data that has the documentid string form*/
                                ProfilePhoto(documentId: data),
                              ],
                            ),
                          );
                        } else {
                          /*If the data is not yet given so it will display no data until data is presented */
                          return const Text("No data");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    /*THE NAME OF THE USER, This future builder will display the name of the current uer
                    its ways ae simillar above */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProfileName(documentId: data),
                              ],
                            ),
                          );
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),

                    /*ID OF THE USER,This future builder will display the name of the current uer
                    its ways ae simillar above */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return ProfileId(documentId: data);
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /*EDIT PROFILE BUTTON */
                    const AdminEditProfileBtn(),
                    const SizedBox(
                      height: 30,
                    ),
                    /*ADMIN RECENT ACTIVITIES BUTTON */
                    AdminRecentActivitiesBtn(),
                    const SizedBox(
                      height: 30,
                    ),
                    const ArchivedAccountOptionsBtn(),
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
      stream: FirebaseFirestore.instance.collection('AdminUsers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: Color(0xFF15be77),
              ),
            ),
          ); // Display a loading indicator while waiting for data.
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
                    //sizedbox for the activity button of admin user
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xEEFF9012),
                                    Color.fromARGB(255, 233, 104, 39),
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
                                  setState(() {
                                    widget.selectedId = "${data["User Id"]}";
                                  });
                                  //assign the widget.selectedId to setAdminUserId
                                  //to bring in other class
                                  Provider.of<AdminActivityProvider>(context,
                                          listen: false)
                                      .setadminUserId(widget.selectedId);
                                  //this will navigate to specific admin activity page
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.adminactivityspage);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    'Activities',
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //sizedbox for the details button of admin user
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //details button decoration
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
                                  setState(() {
                                    widget.selectedId = "${data["User Id"]}";
                                  });
                                  // Retrieve the document ID and check the account status
                                  String docId = widget.selectedId;
                                  String accountStatus =
                                      await checkAccountStatus(docId);

                                  /*if the accountStatus == Active then the admin details provider 
                                    will pass data to the next page*/
                                  if (accountStatus == "Active") {
                                    // Handle active account
                                    Provider.of<AdminDetailsProvider>(context,
                                            listen: false)
                                        .setadminUserId(widget.selectedId);

                                    //then it will navigate to the details page
                                    Navigator.of(context).pushNamed(
                                        RoutesManager.admindetailspage);
                                  }
                                  /*if the status is equal to deactivate it will 
                                    also pass data to the next page*/
                                  else if (accountStatus == "Deactivate") {
                                    Provider.of<AdminDetailsProvider>(context,
                                            listen: false)
                                        .setadminUserId(widget.selectedId);
                                    // this will navigate to the next page which is deactivate page
                                    Navigator.of(context).pushNamed(
                                        RoutesManager.specificadmindeact);
                                  }
                                  /**if the status is equivalent to requesting it will show a dialog box
                                     * user will choose either to proceed or stay in the page */
                                  else if (accountStatus == "Requesting") {
                                    Provider.of<AdminDetailsProvider>(context,
                                            listen: false)
                                        .setadminUserId(widget.selectedId);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Note!"),
                                          content: const Text(
                                              "Account is requesting for reactivation!\nClick proceed to see request."),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Proceed"),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // this will close the dialog box
                                                /**at the same time it will navigate to the next page
                                                   * request reactivation page
                                                   */
                                                Navigator.of(context).pushNamed(
                                                    RoutesManager
                                                        .requestreactivation);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text("Cancel"),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog box
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  /**
                                     * if the status is decline after the admin user decline the request
                                     * the admin can request again and it will navigate to deactivate page
                                     */
                                  else if (accountStatus == "Decline") {
                                    Provider.of<AdminDetailsProvider>(context,
                                            listen: false)
                                        .setadminUserId(widget.selectedId);
                                    // Navigate to the specific "deactivate" page
                                    Navigator.of(context).pushNamed(
                                        RoutesManager.specificadmindeact);
                                  }
                                  /**
                                     * if the status is archived after the admin archived the account
                                     * it will prompt a dialog box that account is archived
                                     */
                                  else if (accountStatus == "Archived") {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Note!"),
                                          content: const Text(
                                              "Account is archived!"),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog box
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // display an error message that account status is unknown
                                    print(
                                        "Unknown account status: $accountStatus");
                                  }
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
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xEEFF9012),
                                  Color.fromARGB(255, 233, 104, 39),
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
                                setState(() {
                                  widget.selectedId = "${data["User Id"]}";
                                });
                                //assign the widget.selectedId to setAdminUserId
                                //to bring in other class
                                Provider.of<AdminActivityProvider>(context,
                                        listen: false)
                                    .setadminUserId(widget.selectedId);
                                //this will navigate to specific admin activity page
                                Navigator.of(context).pushNamed(
                                    RoutesManager.adminactivityspage);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Activities',
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //sizedbox for the details button of admin user
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //details button decoration
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
                                setState(() {
                                  widget.selectedId = "${data["User Id"]}";
                                });
                                // Retrieve the document ID and check the account status
                                String docId = widget.selectedId;
                                String accountStatus =
                                    await checkAccountStatus(docId);

                                /*if the accountStatus == Active then the admin details provider 
                                    will pass data to the next page*/
                                if (accountStatus == "Active") {
                                  // Handle active account
                                  Provider.of<AdminDetailsProvider>(context,
                                          listen: false)
                                      .setadminUserId(widget.selectedId);

                                  //then it will navigate to the details page
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.admindetailspage);
                                }
                                /*if the status is equal to deactivate it will 
                                    also pass data to the next page*/
                                else if (accountStatus == "Deactivate") {
                                  Provider.of<AdminDetailsProvider>(context,
                                          listen: false)
                                      .setadminUserId(widget.selectedId);
                                  // this will navigate to the next page which is deactivate page
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.specificadmindeact);
                                }
                                /**if the status is equivalent to requesting it will show a dialog box
                                     * user will choose either to proceed or stay in the page */
                                else if (accountStatus == "Requesting") {
                                  Provider.of<AdminDetailsProvider>(context,
                                          listen: false)
                                      .setadminUserId(widget.selectedId);
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Note!"),
                                        content: const Text(
                                            "Account is requesting for reactivation!\nClick proceed to see request."),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Proceed"),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // this will close the dialog box
                                              /**at the same time it will navigate to the next page
                                                   * request reactivation page
                                                   */
                                              Navigator.of(context).pushNamed(
                                                  RoutesManager
                                                      .requestreactivation);
                                            },
                                          ),
                                          TextButton(
                                            child: const Text("Cancel"),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog box
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                                /**
                                     * if the status is decline after the admin user decline the request
                                     * the admin can request again and it will navigate to deactivate page
                                     */
                                else if (accountStatus == "Decline") {
                                  Provider.of<AdminDetailsProvider>(context,
                                          listen: false)
                                      .setadminUserId(widget.selectedId);
                                  // Navigate to the specific "deactivate" page
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.specificadmindeact);
                                }
                                /**
                                     * if the status is archived after the admin archived the account
                                     * it will prompt a dialog box that account is archived
                                     */
                                else if (accountStatus == "Archived") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Note!"),
                                        content:
                                            const Text("Account is archived!"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the dialog box
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // display an error message that account status is unknown
                                  print(
                                      "Unknown account status: $accountStatus");
                                }
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

  /*
   * this will retrieve the document id of the specific user id
   * this class is being reused
   */
  UpdateRetriveDocId updateRetrieve = UpdateRetriveDocId();

  /*
  This function will check the account status if it exists 
  */
  Future<String> checkAccountStatus(String userid) async {
    // Retrieve the document ID
    await updateRetrieve.getUpdateDocId(userid);

    // Query Firestore to check the account status
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid)
        .get();

    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        String accountStatus = data['Account Status'] ?? "";
        return accountStatus;
      }
    }

    // If the document doesn't exist or the field is missing, return an empty string
    return "";
  }
}
