// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatePersonalRetriveDocId {
  String mydocid = "";

  Future<String> getUpdateDocId(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    QuerySnapshot query =
        await reference.where('User Id', isEqualTo: myuserid).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      mydocid = documentSnapshot.id;
    } else {
      throw ("Failed id retieval");
    }
    return mydocid;
  }
}
