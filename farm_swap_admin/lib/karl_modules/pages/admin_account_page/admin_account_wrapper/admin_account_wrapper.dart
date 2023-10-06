import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadAdminAccount extends StatelessWidget {
  ReadAdminAccount({super.key, required this.documentId});

  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();

  String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("AdminUsers");
    return FutureBuilder<DocumentSnapshot>(
        future: reference.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic data = snapshot.data!.data() as dynamic;
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          //backgroundImage:
                          // NetworkImage("${data["profileUrl"]}"),
                          radius: 20,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                " ${data["First Name"]} ",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                "${data["Last Name"]}",
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            " ${data["Address"]} ",
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  // Navigator.of(context)
                                  //   .pushNamed(RoutesManager.adminActivities);
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
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
