import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//this class will retrieve the specific document id of the selected user id of the farmer
class RetrieveConsumer {
  String docid = "";

  Future<String> getDocId(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    QuerySnapshot query =
        await reference.where('userId', isEqualTo: myuserid).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      docid = documentSnapshot.id;
    } else {
      print("No document found for user ID: $myuserid");
      throw ("Failed id retrieval");
    }
    return docid;
  }
}

//this class will retrieve the specific document id of the selected user id of the farmer wallet
class RetrieveConsumerWallet {
  String docid = "";

  Future<String> getDocId(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('sample_ConsumerWallet');
    QuerySnapshot query =
        await reference.where('userId', isEqualTo: myuserid).get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      docid = documentSnapshot.id;
    } else {
      print("No document found for user ID: $myuserid");
      throw ("Failed id retrieval");
    }
    return docid;
  }
}

class UpdateConsumerWallet {
  RetrieveConsumer retrieve = RetrieveConsumer();
  /*this function is to update the field balance of the collection sample_farmerUsers
  */
  Future<void> updateBalance(String updatedata, String userid) async {
    /*Calling the getUpdateddocID function from the class UpdateRetrieve 
    reusing the class for retrieving doc id
    */
    await retrieve.getDocId(userid);

    final documentRef = FirebaseFirestore.instance
        .collection('sample_ConsumerUsers')
        .doc(retrieve.docid);

    // Define the data to update which is the account status
    final updateData = {
      'balance': updatedata,
    };

    // Create an admin log with a activity reactivation admin account
    // adminLogs.createAdminLogs(
    //   email, userID, "Accept_Reactivation_Request", DateTime.now());

    try {
      // Update the Firestore document with the new data
      await documentRef.update(updateData);
    } catch (e) {
      print("Error while updating document: $e");
    }
  }

  RetrieveConsumerWallet retrievewallet = RetrieveConsumerWallet();
/*this function is to update the field status of the collection 
sample_farmer wallet
  */
  Future<void> updateStatus(String? updatedata, String userid) async {
    /*Calling the getUpdateddocID function from the class UpdateRetrieve 
    reusing the class for retrieving doc id
    */
    await retrievewallet.getDocId(userid);

    final documentRef = FirebaseFirestore.instance
        .collection('sample_ConsumerWallet')
        .doc(retrievewallet.docid);

    // Define the data to update which is the account status
    final updateData = {
      'status': updatedata,
    };

    // Create an admin log with a activity reactivation admin account
    //adminLogs.createAdminLogs(
    //   email, userID, "Accept_Wallet_Request", DateTime.now());

    try {
      // Update the Firestore document with the new data
      await documentRef.update(updateData);
    } catch (e) {
      print("Error while updating document: $e");
    }
  }
}
