import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ArchiveListing {
  
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> archiveBarterListing(String farmerUname, String pcitureUrl, String farmerid) async {
    String userid = farmerid;
    String category = "BARTER";
    String farmerUsername = farmerUname;
    String docId = '$farmerUsername$category$userid';
    String newStatus = "ARCHIVE";

    QuerySnapshot querySnapshot = await firestore
        .collection("sample_BarterListings")
        .doc(docId)
        .collection("barter")
        .where('listingpictureUrl', isEqualTo: pcitureUrl)
        .get();

        print("Query Parameters: { docId: $docId, pictureUrl: $pcitureUrl }");

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference docref = querySnapshot.docs.first.reference;
      try {
        await docref.update({'listingstatus': newStatus});
      } catch (e) {
        throw ('No document', e);
      }
    } else {
      print("No Document found!");
    }
  }

  Future<void> archiveSellingListing(String farmerUname, String pcitureUrl, String farmerid) async {
    String userid = farmerid;
    String category = "SELL";
    String farmerUsername = farmerUname;
    String docId = '$farmerUsername$category$userid';
    String newStatus = "ARCHIVE";

    QuerySnapshot querySnapshot = await firestore
        .collection("sample_SellListings")
        .doc(docId)
        .collection("sell")
        .where('listingpictureUrl', isEqualTo: pcitureUrl)
        .get();

      print("Query Parameters: { docId: $docId, pictureUrl: $pcitureUrl }");

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference docref = querySnapshot.docs.first.reference;
      try {
        await docref.update({'listingstatus': newStatus});
      } catch (e) {
        throw ('Way docs makit an', e);
      }
    }
  }
}
