import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RetrieveDocID {
  String docID = "";
  FirebaseFirestore firestoreDatabase = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<String> getDocsId() async {
    //This line queries the 'Users' collection in Firestore and retrieves documents
    //where the 'User Id' field is equal to the current user's UID (userId).
    await firestoreDatabase
        .collection('AdminUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        //It iterates through the documents in the result using .docs.forEach
        .then((value) => value.docs.forEach((element) {
              docID = element.reference.id;
            }));
    return docID;
  }
}
