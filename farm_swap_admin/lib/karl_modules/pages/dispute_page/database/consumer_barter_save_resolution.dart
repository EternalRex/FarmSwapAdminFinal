import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/models/consumer_barter_resolution_model.dart';

class SaveConsumerBarterDisputeResolution {
  /*Saves the resolution to the database */
  Future<void> consBarterResolution(
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
    final saveCBarterResol = ConsumerBarterResolution(
      listUrl: listUrl,
      itemUrl: itemUrl,
      adminemail: adminEmail,
      resolutionMessage: resolMessage,
      penaltyMessage: penaltyMessage,
      resolutionDate: resolDate,
      consumerid: consumerid,
      farmerid: farmerid,
      reportedUname: farmerUname,
      reportingUname: consumerUName,
      reportedRole: "FARMER",
      reportingRole: "CONSUMER",
    );

    FirebaseFirestore.instance.collection('sample_CBarterResolution').add(
          saveCBarterResol.toMap(),
        );
  }

  /*Updates the dipsute resolution page as resolved*/
  Future<void> updateConsumerDisputeResolved(String listId, consumerId) async {
    String finalId = 'DISPUTE$consumerId';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('sample_ConsumerBarterDispute')
        .doc(finalId)
        .collection('cBarterDispute')
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
