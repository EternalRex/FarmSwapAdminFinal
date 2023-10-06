//class to read all admin account users
import 'package:cloud_firestore/cloud_firestore.dart';

class GetAllAdminAccs {
  List<String> documentID = [];

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<dynamic> getDocsId() async {
    await _db.collection("AdminUsers").get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              documentID.add(document.reference.id);
            },
          ),
        );
  }
}
