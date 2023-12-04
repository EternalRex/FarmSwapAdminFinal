import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/models/famer_sale_resolution_model.dart';

class FarmerSaveSellResolution {
  Future<void> farmerSellResolution(
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
    final saveCSellResol = FarmerSaleResoluitonModel(
      listUrl: listUrl,
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

    FirebaseFirestore.instance.collection('sample_FSellResolution').add(
          saveCSellResol.toMap(),
        );
  }

  /*Updates the dipsute resolution page as resolved*/
  Future<void> updateFarmerDisputeResolved(String disputeUrl, String farmerid) async {
    String finalId = 'DISPUTESALE$farmerid';
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('sample_FarmerSaleDispute')
        .doc(finalId)
        .collection('fSaleDispute')
        .where("disputeUrl", isEqualTo: disputeUrl)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference docRef = querySnapshot.docs.first.reference;
      try {
        await docRef.update({'disputeStatus': "RESOLVED"});
      } catch (e) {
        print("Empty document para ma update ang selected property$e");
      }
    } else {
      throw Exception("Indexing Problem");
    }
  }
}
