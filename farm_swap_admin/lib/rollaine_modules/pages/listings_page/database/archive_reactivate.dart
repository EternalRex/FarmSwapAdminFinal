import 'package:cloud_firestore/cloud_firestore.dart';

class ArchiveReactivateListing {

  final firestore = FirebaseFirestore.instance;

  Future<void> archiveReactBarter(String farmerUname, String pictureUrl, String farmerid) async {
    String userid = farmerid;
    String category = "BARTER";
    String farmerUsername = farmerUname;
    try {
      String docId = '$farmerUsername$category$userid';
      if (userid.isEmpty) {
        print("User ID is empty");
        return;
      }
      String newStatus = "ACTIVE";

      QuerySnapshot querySnapshot = await firestore
          .collection("sample_BarterListings")
          .doc(docId)
          .collection("barter")
          .where('listingpictureUrl', isEqualTo: pictureUrl)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docref = querySnapshot.docs.first.reference;
        await docref.update({'listingstatus': newStatus});
      } else {
        print('No document found');
      }
    } catch (e) {
      print("Error updating barter listing status: $e");
    }
  }

  Future<void> archiveReactSelling(
      String farmerUname, String pictureUrl, String farmerid) async {
    String userid = farmerid;
    String category = "SELL";
    String farmerUsername = farmerUname;
    try {
      String docId = '$farmerUsername$category$userid';
      if (docId.isEmpty) {
        print("User ID is empty");
        return;
      }
      String newStatus = "ACTIVE";

      QuerySnapshot querySnapshot = await firestore
          .collection("sample_SellListings")
          .doc(docId)
          .collection("sell")
          .where('listingpictureUrl', isEqualTo: pictureUrl)
          .get();

      print("Query Parameters: { docId: $docId, pictureUrl: $pictureUrl }");

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docref = querySnapshot.docs.first.reference;
        await docref.update({'listingstatus': newStatus});
      } else {
        print('No document found');
      }
    } catch (e) {
      print("Error updating selling listing status: $e");
    }
  }
}
