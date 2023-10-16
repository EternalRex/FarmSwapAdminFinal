import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/provider/customer_userId_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/customers/customer_account_query.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReadCustomerAccount extends StatefulWidget {
  ReadCustomerAccount({super.key, required this.documentId});

  String documentId;
  String chosenId = '';

  @override
  State<ReadCustomerAccount> createState() => _ReadCustomerAccountState();
}

class _ReadCustomerAccountState extends State<ReadCustomerAccount> {
  final RetrieveCustomerAccounts retrieveCustomerAccounts =
      RetrieveCustomerAccounts();

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('CustomerUsers');
    return FutureBuilder(
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          final customerProfile = CachedNetworkImageProvider("${data["profileUrl"]}");
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        backgroundImage: customerProfile,
                        radius: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${data["firstName"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${data["lastName"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const Spacer(),
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
                                setState(() {
                                  widget.chosenId = "${data["userId"]}";
                                });
                                Provider.of<CustomerUserIdProvider>(context, listen: false).setcustomerUserId(widget.chosenId);
                                Navigator.of(context).pushNamed(RoutesManager.detailsCustomerPage);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  'Details',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 9,
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
}
