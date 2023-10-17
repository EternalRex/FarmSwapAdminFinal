import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveCustomerUserId {
  String? documentId;

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String?> getDocsId(String data) async {
    String customerData = data;
    await db
        .collection("CustomerUsers")
        .where("userId", isEqualTo: customerData)
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
