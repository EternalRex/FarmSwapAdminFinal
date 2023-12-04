import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GetFarmerAdmiSellingResol extends StatefulWidget {
  const GetFarmerAdmiSellingResol({super.key});

  @override
  State<GetFarmerAdmiSellingResol> createState() => _GetFarmerAdmiSellingResolState();
}

class _GetFarmerAdmiSellingResolState extends State<GetFarmerAdmiSellingResol> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('sample_FSellResolution')
          .orderBy('resolutionDate', descending: true)
          .where('adminemail', isEqualTo: FirebaseAuth.instance.currentUser?.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // ignore: avoid_print
          print(snapshot.error);
          return const Text("Indexing Problem");
        }
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data!.docs
                .map((document) => _buildFCompleteBarterListItems(document))
                .toList(),
          );
          /* return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs
                  .map<Widget>((document) => _buildFCompleteBarterListItems(document))
                  .toList(),
            ); */
        } else {
          return const Center(
            child: Text("No Reports Yet"),
          );
        }
      },
    );
  }

  Widget _buildFCompleteBarterListItems(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    String listingUrl = data['listUrl'];
    String adminEmail = data['adminemail'];
    String consumerid = data['consumerid'];
    String farmerid = data['farmerid'];
    String penaltyMessage = data['penaltyMessage'];
    Timestamp resolDate = data['resolutionDate'];
    String resolutionMessage = data['resolutionMessage'];
    String reported = data['reportedUser'];
    String reporting = data['reportingUser'];
    String reportedRole = data['reportedRole'];
    String reportingRole = data['reportingRole'];

    /*Time conversion */
    DateTime resolDateDateTime = resolDate.toDate();
    String resolDateString = DateFormat('dd-yyyy-MM').format(resolDateDateTime);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 100,
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
        child: Row(
          children: [
            /*The listing image */
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(listingUrl),
                radius: 40,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                poppinsText(reporting, Colors.black, 20, FontWeight.normal),
                poppinsText("Reporting User", Colors.black54, 15, FontWeight.normal),
                poppinsText(resolDateString, Colors.black54, 15, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                poppinsText(reported, Colors.black, 20, FontWeight.normal),
                poppinsText("Reported User", Colors.black54, 15, FontWeight.normal),
                const SizedBox(
                  height: 10,
                ),
                poppinsText(penaltyMessage, Colors.black, 20, FontWeight.normal),
                poppinsText("Penalty", Colors.black54, 15, FontWeight.normal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
