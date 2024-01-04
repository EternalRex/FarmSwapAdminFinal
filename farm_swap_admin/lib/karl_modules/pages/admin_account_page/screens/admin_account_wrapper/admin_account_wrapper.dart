// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/wrapper/admin_details.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/provider/admin_details_provider.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../admin_account_logs/provider/adminlogs_provider.dart';
import '../admin_user_details/drop_down_update/update_retrieve_docID.dart';

// ignore: must_be_immutable
class ReadAdminAccount extends StatefulWidget {
  ReadAdminAccount({
    super.key,
    this.documentId,
  });

  final String? documentId;
  String selectedId = "";

  @override
  State<ReadAdminAccount> createState() => _ReadAdminAccountState();
}

class _ReadAdminAccountState extends State<ReadAdminAccount> {
  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
  AdminUserDetails adminDetails = AdminUserDetails();

  @override
  Widget build(BuildContext context) {
    //this line will get the admin user collection in the firestore
    CollectionReference admiRef =
        FirebaseFirestore.instance.collection("AdminUsers");

    return FutureBuilder<DocumentSnapshot>(
        future: admiRef.doc(widget.documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            final profileImage =
                CachedNetworkImageProvider("${data["profileUrl"]}");
            //if the profile url is not empty this container will return
            return Container(
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
                      //this is the sizedox for the image, lastname,firstname,
                      //and location for the admin user
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
                      //sizedbox to separate the two sizedbox
                      const SizedBox(
                        width: 240,
                      ),
                      //sizedbox for the activities button of admin user
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
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
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
                                    else if (accountStatus == "Deactivated") {
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
                                                  Navigator.of(context)
                                                      .pushNamed(RoutesManager
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
                                    else if (accountStatus == "Declined") {
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
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
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
            );
          }
          return const Center(
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            ),
          );
        });
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
