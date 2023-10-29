import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveFarmerUserId {

  //It will store the document ID that is retrieved from Firestore
  String? documentId;

  //Creates an instance of the FirebaseFirestore class named db
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Provides a method (getDocsId) to retrieve the document ID from the 'FarmerUsers' collection in Firestore based on a provided 'userId'
  Future<String?> getDocsId(String data) async {
    String farmerData = data;
    await db
        .collection("sample_FarmerUsers")
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