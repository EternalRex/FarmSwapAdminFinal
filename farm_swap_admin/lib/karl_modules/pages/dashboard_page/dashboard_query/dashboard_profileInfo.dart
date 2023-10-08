import "dart:typed_data";
import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import "package:farm_swap_admin/karl_modules/pages/dashboard_page/data/testData/DashboardPieGraph/piegraph.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class ProfilePhoto extends StatefulWidget {
  ProfilePhoto({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
//Object of the get document id class
  final DashboardRetrieveSpecificID myId = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    print(widget.documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          final image = CachedNetworkImageProvider("${data["profileUrl"]}");
          return Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: image,
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ProfileId extends StatelessWidget {
  const ProfileId({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    print(documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SizedBox(
                width: 200,
                child: Text(
                  "ID: ${data["User Id"]}",
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    print(documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          dynamic data = snapshot.data!.data() as dynamic;
          String firstName =
              data?["First Name"] ?? "N/A"; // Check if the field exists
          String lastName =
              data?["Last Name"] ?? "N/A"; // Check if the field exists

          return Center(
            child: Row(
              children: [
                Text(
                  " $firstName",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  " $lastName",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
