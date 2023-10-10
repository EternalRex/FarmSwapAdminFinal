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
                        width: 250,
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
                              children: [
                                //first column that holds the admin user firstname and username
                                SizedBox(
                                  width: 100,
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
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "${data["Address"]}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //sizedbox to separate the two sizedbox
                      const SizedBox(
                        width: 350,
                      ),
                      //sizedbox for the activities button of admin user
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Accept button
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
                                    // Navigator.of(context)
                                    //   .pushNamed(RoutesManager.adminActivities);
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
                              //details button
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
                                    setState(() {
                                      widget.selectedId = "${data["User Id"]}";
                                    });
                                    //assign the widget.selectedId to setAdminUserId
                                    //to bring in other class
                                    Provider.of<AdminDetailsProvider>(context,
                                            listen: false)
                                        .setadminUserId(widget.selectedId);
                                    //this will navigate to admin details.dart
                                    Navigator.of(context).pushNamed(
                                        RoutesManager.admindetailspage);
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
}
