import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/models/consumer_sell_resolution_model.dart';

class ConsumerSaveSellResolution {
  Future<void> consSellResolution(
    String listUrl,
    String adminEmail,
    String resolMessage,
    String penaltyMessage,
    DateTime resolDate,
    String farmerid,
    String consumerid,
    String farmerUname,
    String consumerUName,
  ) async {
    final saveCSellResol = ConsumerSellResolutionModel(
      listUrl: listUrl,
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

    FirebaseFirestore.instance.collection('sample_CSellResolution').add(
          saveCSellResol.toMap(),
        );
  }

  /*Updates the dipsute resolution page as resolved*/
  Future<void> updateConsumerDisputeResolved(String disputeUrl, String consumerId) async {
    String finalId = 'DISPUTE$consumerId';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('sample_ConsumerSaleDispute')
        .doc(finalId)
        .collection('cSaleDispute')
        .where("disputeUrl", isEqualTo: disputeUrl)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference docRef = querySnapshot.docs.first.reference;
      try {
        await docRef.update({'isResolved': true, 'disputeStatus': "RESOLVED"});
      } catch (e) {
        print("Empty document para ma update ang selected property$e");
      }
    } else {
      throw Exception("Indexing Problem");
    }
  }
}
