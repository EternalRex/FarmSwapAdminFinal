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
          (value) => value.docs.forEach(
            (element) {
              documentId = element.reference.id;
            },
          ),
        );
    return documentId;
  }
}