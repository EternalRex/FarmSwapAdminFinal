import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/provider/farmer_userId_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/farmer_account_query.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReadFarmerAccount extends StatefulWidget {
  ReadFarmerAccount({super.key, required this.documentId});

  //Variable na document id nga String
  String documentId;

  //Variable na selected id nga String
  String selectedId = '';

  @override
  State<ReadFarmerAccount> createState() => _ReadFarmerAccountState();
}

class _ReadFarmerAccountState extends State<ReadFarmerAccount> {

  final RetrieveFarmerAccounts retrieveUserAccounts = RetrieveFarmerAccounts();

  TextEditingController searchController = TextEditingController();
  String searchValue = '';


  @override
  Widget build(BuildContext context) {

    //Creates a reference to a Firestore collection named 'FarmerUsers' using the FirebaseFirestore instance
    CollectionReference reference = FirebaseFirestore.instance.collection('sample_FarmerUsers');

    //Fetch data from Firestore and then build a widget based on the retrieved data
    return FutureBuilder(

      //Retrieves a specific document from the 'FarmerUsers' collection using the doc method
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;

          //Loads an image from the URL specified in the profileUrl field in the Firestore document data
          final farmerProfile = CachedNetworkImageProvider("${data["profilePhoto"]}");

          //Container for the Farmer's name and details
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
                //Row where the profile, first name, last name, and details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      //profile of farmer
                      child: CircleAvatar(
                        backgroundImage: farmerProfile,
                        radius: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    //First name of farmer
                    Text(
                      "${data["firstname"]}",
                      style: Poppins.farmerName.copyWith(
                        color: const Color(0xFF09051B),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    //Last name of farmer
                    Text(
                      "${data["lastname"]}",
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
                                disabledForegroundColor: Colors.transparent.withOpacity(0.38),
                                disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: () {

                                //Update the state of the widget with the selected user's ID
                                setState(() {
                                  widget.selectedId = "${data["userId"]}";
                                });

                                //Uses the Provider package to set the user ID in a state management provider
                                Provider.of<FarmerUserIdProvider>(context, listen: false)
                                    .setfarmerUserId(widget.selectedId);
                                
                                //Navigates to a different screen
                                Navigator.of(context).pushNamed(RoutesManager.detailsFarmerPage);
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
