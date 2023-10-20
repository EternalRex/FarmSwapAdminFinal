// ignore: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateRetriveDocId {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> getUpdateDocId(String userId) async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    QuerySnapshot query =
        await reference.where('User Id', isEqualTo: userId).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      return documentSnapshot.id;
    } else {
      throw ("Failed id retrieval");
    }
  }
}
