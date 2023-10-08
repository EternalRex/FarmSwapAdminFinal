import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveFarmerAccounts {
  List<String> documentId = [];

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future getDocsId() async {
    await db.collection('FarmerUsers').get().then(
          // ignore: avoid_function_literals_in_foreach_calls
          (snapshot) => snapshot.docs.forEach(
            (document) {
              documentId.add(document.reference.id);
            },
          ),
        );
  }
}