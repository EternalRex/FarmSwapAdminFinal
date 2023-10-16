/*This class will get the userid of the logged in user and based on that user id
this class will return the document id where that user id belong */

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateOnlineStatusQuerry {
/*a variable that will hold the returned doc id */
  String documentId = "";

/*A method that will return the document id and will accept a user id as parameter*/
  Future<String?> getDocumentId(String userid) async {
/*Creating a reference to the collection we want to querry */
    CollectionReference reference = FirebaseFirestore.instance.collection("AdminUsers");

/*Creating a query object to querry in the collection */
    QuerySnapshot querry = await reference.where('User Id', isEqualTo: userid).get();

    if (querry.docs.isNotEmpty) {
      DocumentSnapshot document = querry.docs.first;
      documentId = document.id;
    }
    return documentId;
  }
}
