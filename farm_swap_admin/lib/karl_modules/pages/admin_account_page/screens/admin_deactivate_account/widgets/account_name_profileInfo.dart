import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

/*We created this class to be called in the dashboard this will take a value which 
is the document id we get from our firebase query. That is why this class has a 
constructor required documentID*/

class ProfilePhotoAccountArchived extends StatefulWidget {
  const ProfilePhotoAccountArchived({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  State<ProfilePhotoAccountArchived> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhotoAccountArchived> {
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
                radius: 40,
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
