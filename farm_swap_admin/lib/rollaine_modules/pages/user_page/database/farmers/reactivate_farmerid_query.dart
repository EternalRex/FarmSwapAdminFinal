import 'package:cloud_firestore/cloud_firestore.dart';

class ReactivateFarmerId {

  String docId = '';

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> getUpdateDocId(String userId) async {
    CollectionReference reference = FirebaseFirestore.instance.collection('sample_FarmerUsers');
    QuerySnapshot query = await reference.where('userId', isEqualTo: userId).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      docId = documentSnapshot.id;
      print('Document ID: $docId');
      return docId;
    } else {
      throw ('Failed to retrieve Document ID');
    }
  }
}