import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserId {

  //This variable will store the document ID retrieved from Firestore.
  String docId = '';

  Future<String> getUpdateUserId(String userid) async {
    String userId = userid;

    //It creates a reference to the Firestore collection.
    CollectionReference reference = FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    
    //Performs a query to retrieve documents.
    QuerySnapshot query = await reference.where('userId', isEqualTo: userId).get();

    //Checks if the query returned any documents.
    if (query.docs.isNotEmpty) {

      //It retrieves the first document's snapshot, which contains the document ID.
      DocumentSnapshot documentSnapshot = query.docs.first;
      docId = documentSnapshot.id;
    } else {

      //If no documents are found, it prints a message.
      print('No document found for user ID: $userId');
      throw('Failed ID retrieval');
    }
    return docId;
  }
}