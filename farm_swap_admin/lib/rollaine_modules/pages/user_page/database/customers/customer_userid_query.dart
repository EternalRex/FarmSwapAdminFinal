import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveCustomerUserId {

  //It will store the document ID that is retrieved from Firestore
  String? documentId;

  //Creates an instance of the FirebaseFirestore class named db
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Provides a method (getDocsId) to retrieve the document ID from the 'CustomerUsers' collection in Firestore based on a provided 'userId'
  Future<String?> getDocsId(String data) async {
    String customerData = data;
    await db
        .collection("sample_ConsumerUsers")
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
