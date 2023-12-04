import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/models/farmer_barter_resolution_model.dart';

class SaveFarmerBarterDisputeResolution {
  /*Saves the resolution to the database */
  Future<void> farmeBarterResolution(
    String listUrl,
    String itemUrl,
    String adminEmail,
    String resolMessage,
    String penaltyMessage,
    DateTime resolDate,
    String farmerid,
    String consumerid,
    String farmerUname,
    String consumerUName,
  ) async {
    final saveCBarterResol = FarmerResolutionModel(
      listUrl: listUrl,
      itemUrl: itemUrl,
      adminemail: adminEmail,
      resolutionMessage: resolMessage,
      penaltyMessage: penaltyMessage,
      resolutionDate: resolDate,
      consumerid: consumerid,
      farmerid: farmerid,
      reportedUname: consumerUName,
      reportingUname: farmerUname,
      reportedRole: "CONSUMER",
      reportingRole: "FARMER",
    );

    FirebaseFirestore.instance.collection('sample_fBarterResolution').add(
          saveCBarterResol.toMap(),
        );
  }

  /*Updates the dipsute resolution page as resolved*/
  Future<void> updateFarmerDisputeResolved(String listId, farmerid) async {
    String finalId = 'DISPUTE$farmerid';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('sample_FarmerBarterDispute')
        .doc(finalId)
        .collection('fBarterDispute')
        .where("listingId", isEqualTo: listId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference docRef = querySnapshot.docs.first.reference;
      try {
        await docRef.update({'isResolved': true, 'farmerDisputeStatus': "RESOLVED"});
      } catch (e) {
        print("Empty document para ma update ang selected property$e");
      }
    } else {
      throw Exception("Indexing Problem");
    }
  }
}
