import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArchiveReactivateListing {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> archiveReactBarter(String farmerUname, String pcitureUrl) async {
    String userid = _firebaseAuth.currentUser!.uid;
    String category = "BARTER";
    String farmerUsername = farmerUname;
    String docId = '$farmerUsername$category$userid';
    String newStatus = "ACTIVE";

      QuerySnapshot querySnapshot = await _firestore
          .collection("sample_BarterListings")
          .doc(docId)
          .collection("barter")
          .where('listingpictureUrl', isEqualTo: pcitureUrl)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docref = querySnapshot.docs.first.reference;
        try {
          await docref.update({'listingstatus': newStatus});
        } catch (e) {
          throw ('Way docs makit an', e);
        }
      } else {
        print("no docs found");
      }
  }

  Future<void> archiveReactSelling(
      String farmerUname, String pcitureUrl) async {
    String userid = _firebaseAuth.currentUser!.uid;
    String category = "SELL";
    String farmerUsername = farmerUname;
    String docId = '$farmerUsername$category$userid';
    String newStatus = "ACTIVE";

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection("sample_SellListings")
          .doc(docId)
          .collection("sell")
          .where('listingpictureUrl', isEqualTo: pcitureUrl)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentReference docref = querySnapshot.docs.first.reference;
        try {
          await docref.update({'listingstatus': newStatus});
        } catch (e) {
          throw ('Way docs makit an', e);
        }
      }
    } catch (e) {
      print("Error updating listing status: $e");
    }
  }
}
