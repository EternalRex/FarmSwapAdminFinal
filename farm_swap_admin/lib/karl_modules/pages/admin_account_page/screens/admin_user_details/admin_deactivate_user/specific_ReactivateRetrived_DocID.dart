// ignore: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

// Function to retrieve the document ID based on a user ID
class ReactivateRetrieveDocId {
  String mydocid = "";

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> getUpdateDocId(String userId) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    QuerySnapshot query =
        await reference.where('User Id', isEqualTo: userId).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      mydocid = documentSnapshot.id; // Set the document ID here
      print("Document ID: $mydocid");
      return mydocid;
    } else {
      throw ("Failed to retrieve document ID");
    }
  }
}
