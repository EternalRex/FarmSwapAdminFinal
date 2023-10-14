import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveFarmerUserId {
  String? documentId;

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String?> getDocsId(String data) async {
    String farmerData = data;
    await db
        .collection("FarmerUsers")
        .where("userId", isEqualTo: farmerData)
        .get()
        .then(
          // ignore: avoid_function_literals_in_foreach_calls
          (value) => value.docs.forEach(
            (element) {
              documentId = element.reference.id;
            },
          ),
        );
    return documentId;
  }
}