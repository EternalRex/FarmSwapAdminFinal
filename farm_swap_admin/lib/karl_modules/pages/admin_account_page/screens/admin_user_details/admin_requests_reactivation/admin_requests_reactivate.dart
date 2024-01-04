import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import '../../admin_account_logs/database/admin_logs_insert.dart';
import '../drop_down_update/update_retrieve_docID.dart';
import '../provider/admin_details_provider.dart';

// ignore: must_be_immutable
class RequestReactivationLists extends StatefulWidget {
  RequestReactivationLists({
    super.key,
    this.documentID,
  });
  final String? documentID;
  String selectedId = "";

  @override
  State<RequestReactivationLists> createState() =>
      _RequestReactivationListsState();
}

class _RequestReactivationListsState extends State<RequestReactivationLists> {
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
                          .pushNamed(RoutesManager.adminAccount);
                    },
                  ),
                  title: const DashBoardTitleText(
                    myText: "Reactivation Requests",
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
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xFFDA6317),
                              ),
                            ),
                            prefixIconColor: const Color(0xFFDA6317),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              searchValue = searchController.text;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                body: Row(
                  children: [
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
                                        top: 15,
                                        left: 15,
                                        right: 15,
                                        bottom: 5),

                                    //this padding holds the content title
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
                                              'Admin Requests',
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
                                      child: _buildUserList(),
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

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('AdminUsers')
          .where('Account Status', isEqualTo: 'Requesting')
          .snapshots(),
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
          final logs = snapshot.data!.docs;

          if (logs.isEmpty) {
            return const Center(
              child: Text('No admin reactivation request available for now!'),
            );
          }
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
    Timestamp dateTimestamp = document["Registration Date"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
/*Only the specific account searched will display*/
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();
      if (data["First Name"].toString().toLowerCase() == searchValueLowerCase ||
          data["Last Name"].toString().toLowerCase() == searchValueLowerCase ||
          data["Email Address"].toString().toLowerCase() ==
              searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
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
                            child: //this will display the users profile picture in each listtile
                                CachedNetworkImage(
                              imageUrl: data["profileUrl"] ??
                                  "", // Provide a default empty string if it's null
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
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
                    //sizedbox for accept button of admin reactivation
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
                                onPressed: () async {
                                  setState(() {
                                    widget.selectedId =
                                        "${document["User Id"]}";
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirmation!"),
                                        content: const Text(
                                            "Account is requesting for reactivation!\nClick proceed to accept request."),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Proceed"),
                                            onPressed: () async {
                                              Navigator.of(context)
                                                  .pop(); // this will close the dialog box
                                              /**
                                                                              * In this function when the button is clicked it will update the selected id
                                                                              * the account status into active then it will also create admin logs
                                                                              */
                                              await updateField(
                                                  "Active", widget.selectedId);

                                              //this will navigate to request reactivate account page
                                              // ignore: use_build_context_synchronously
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //decline button
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
                                    widget.selectedId =
                                        "${document["User Id"]}";
                                  });
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Confirmation!"),
                                        content: const Text(
                                            "Are you sure you want to decline request?\nClick proceed to decline request."),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("Proceed"),
                                            onPressed: () async {
                                              Navigator.of(context)
                                                  .pop(); // this will close the dialog box
                                              //create logs here where the account status filed will be set to deactivated
                                              await updateField1(
                                                  "Decline", widget.selectedId);

                                              // ignore: use_build_context_synchronously
                                              Provider.of<AdminDetailsProvider>(
                                                      context,
                                                      listen: false)
                                                  .setadminUserId(
                                                      widget.selectedId);

                                              //this will navigate to specific admin deactivate page
                                              // ignore: use_build_context_synchronously
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
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                          child: //this will display the users profile picture in each listtile
                              CachedNetworkImage(
                            imageUrl: data["profileUrl"] ??
                                "", // Provide a default empty string if it's null
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
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
                  //sizedbox for accept button of admin reactivation
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
                              onPressed: () async {
                                setState(() {
                                  widget.selectedId = "${document["User Id"]}";
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirmation!"),
                                      content: const Text(
                                          "Account is requesting for reactivation!\nClick proceed to accept request."),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Proceed"),
                                          onPressed: () async {
                                            Navigator.of(context)
                                                .pop(); // this will close the dialog box
                                            /**
                                            * In this function when the button is clicked it will update the selected id
                                            * the account status into active then it will also create admin logs
                                            */
                                            await updateField(
                                                "Active", widget.selectedId);

                                            //this will navigate to request reactivate account page
                                            // ignore: use_build_context_synchronously
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //decline button
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
                                  widget.selectedId = "${document["User Id"]}";
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirmation!"),
                                      content: const Text(
                                          "Are you sure you want to decline request?\nClick proceed to decline request."),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Proceed"),
                                          onPressed: () async {
                                            Navigator.of(context)
                                                .pop(); // this will close the dialog box
                                            //create logs here where the account status filed will be set to deactivated
                                            await updateField1(
                                                "Decline", widget.selectedId);

                                            // ignore: use_build_context_synchronously
                                            Provider.of<AdminDetailsProvider>(
                                                    context,
                                                    listen: false)
                                                .setadminUserId(
                                                    widget.selectedId);

                                            //this will navigate to specific admin deactivate page
                                            // ignore: use_build_context_synchronously
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

//create a varaible for the current user in making admin logs
  final email = FirebaseAuth.instance.currentUser!.email;
  final userID = FirebaseAuth.instance.currentUser!.uid;
  UpdateRetriveDocId updateRetrieve = UpdateRetriveDocId();
  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

  /*this function is to update the field account status into active
  then this will also create admin logs
  */
  Future<void> updateField(String? updatedata, String userid) async {
    /*Calling the getUpdateddocID function from the class UpdateRetrieve 
    reusing the class for retrieving doc id
    */
    await updateRetrieve.getUpdateDocId(userid);

    final documentRef = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    // Define the data to update which is the account status
    final updateData = {
      'Account Status': updatedata,
    };

    // Create an admin log with a activity reactivation admin account
    adminLogs.createAdminLogs(
        email, userID, "Accept_Reactivation_Request", DateTime.now());

    try {
      // Update the Firestore document with the new data
      await documentRef.update(updateData);
    } catch (e) {
      print("Error while updating document: $e");
    }
  }

/*this function is to update the field account status into decline
  then this will also create admin logs
  */
  Future<void> updateField1(String? updatedata, String userid) async {
    // Calling the getUpdateddocID function from the class UpdateRetrieve
    await updateRetrieve.getUpdateDocId(userid);

    final documentRef = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    // Define the data to update which is the account status
    final updateData = {
      'Account Status': updatedata,
    };

    // Create an admin log with a activity decline requests admin account
    adminLogs.createAdminLogs(
        email, userID, "Decline_Reactivation_Request", DateTime.now());

    try {
      // Update the Firestore document with the new data
      await documentRef.update(updateData);
    } catch (e) {
      print("Error while updating document: $e");
    }
  }
}
