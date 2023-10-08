import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

/*We created this class to be called in the dashboard this will take a value which 
is the document id we get from our firebase query. That is why this class has a 
constructor required documentID*/

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
  @override
  Widget build(BuildContext context) {
    /*We create a reference to our firestore collection so that we can acces it*/
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');

    /*Test print the document Id  if it has really a value, we used the word widget here to 
    access the documentID variable because it is on another class because we are using stateful here */
    print(widget.documentId);

    return FutureBuilder<DocumentSnapshot>(
      /*we are going to access our documents in firebase but first we need to await for
      the value of document id which will be given from our dasboard where we call this class */
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          /*Creating a dynamic variable and store and store the data we get from our querry which
          we aceessed using the word snapshot */
          dynamic data = snapshot.data!.data() as dynamic;

          /*Display the image */
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

/*This is the class for displaying the user ID, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
class ProfileId extends StatelessWidget {
  const ProfileId({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    /*We create a reference to our firestore collection so that we can acces it*/
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');

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

/*This is the class for displaying the user ID, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
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
