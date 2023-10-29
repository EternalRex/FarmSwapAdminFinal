import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveCustomerAccounts {

  //Declares a list named documentId that will store a collection of strings, specifically document IDs retrieved from Firestore
  List<String> documentId = [];

  //Creates an instance of the FirebaseFirestore class named db
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Provides a method (getDocsId) for fetching document IDs from the 'CustomerUsers' collection in Firestore and storing them in the documentId list
  Future getDocsId() async {
    await db.collection('sample_ConsumerUsers').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (document) {
              documentId.add(document.reference.id);
            },
          ),
        );
  }
}
