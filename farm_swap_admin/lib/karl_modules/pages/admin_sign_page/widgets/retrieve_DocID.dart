import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RetrieveDocId {
  String documentID = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getDocsId() async {
    // Query to retrieve the document ID
    await db
        .collection('AdminUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              documentID = element.reference.id;
            }));
    return documentID;
  }
}

//kani na class kay gi call para sa collection na archived admin users
//if ang userId kay equal sa current uid mag return siya ug documentID which is
//gigamit sa login function
class RetrieveDocIdArchived {
  String documentID = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getDocsId() async {
    // Query to retrieve the document ID
    await db
        .collection('AdminArchivedUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              documentID = element.reference.id;
            }));
    return documentID;
  }
}
