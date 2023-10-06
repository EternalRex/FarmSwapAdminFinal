import "package:cloud_firestore/cloud_firestore.dart";
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import "package:farm_swap_admin/constants/Colors/colors.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class ProfilePhoto extends StatelessWidget {
  ProfilePhoto({
    super.key,
    required this.documentId,
  });

//Object of the get document id class
  final DashboardRetrieveSpecificID myId = DashboardRetrieveSpecificID();
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
          return Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("${data["profileUrl"]}"),
              ),
              /*POSITIONING THE ADD PHOTO ICON INSIDE THE STACK */
              Positioned(
                width: 100,
                bottom: -10,
                left: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_a_photo),
                  color: farmSwapSmoothGreen,
                ),
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
              child: Text(
                "ID: ${data["User Id"]}",
                style: GoogleFonts.poppins(
                  fontSize: 10,
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
                ),
                Text(
                  " $lastName",
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
