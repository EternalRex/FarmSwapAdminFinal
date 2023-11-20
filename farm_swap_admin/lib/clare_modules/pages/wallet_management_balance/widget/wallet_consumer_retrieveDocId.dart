// ignore_for_file: avoid_print, unnecessary_null_comparison
import 'package:cloud_firestore/cloud_firestore.dart';

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

  //kani na function kay gamiton sa pagkuha sa doc id na ang field kay naay request equivalent to cash out
  Future<String> getConsumerRequestCashOut(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('sample_ConsumerWallet');
    QuerySnapshot query = await reference
        .where('userId', isEqualTo: userid)
        .where('request', isEqualTo: 'Cash Out')
        .get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      docid = documentSnapshot.id;
    } else {
      print("No document found for user ID: $myuserid");
      throw ("Failed id retrieval");
    }
    return docid;
  }

  //check the farmer if ang request kay cash out
  Future<String> checkConsumerRequest(String documentId) async {
    // Query Firestore to check the account status
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('sample_ConsumerWallet')
        .doc(documentId)
        .get();

    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        String request = data['request'] ?? "";
        return request;
      }
    }

    // If the document doesn't exist or the field is missing, return an empty string
    return "";
  }
}

class UpdateConsumerWallet {
  RetrieveConsumer retrieve = RetrieveConsumer();

  //getting the document id
  Future<String> getConsumer(String userId) async {
    try {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('sample_ConsumerUsers');
      QuerySnapshot query =
          await reference.where('userId', isEqualTo: userId).get();

      if (query.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = query.docs.first;
        return documentSnapshot.id;
      } else {
        print("No document found for user ID: $userId");
        return ''; // Return an empty string if the document is not found
      }
    } catch (e) {
      print("Error while retrieving document ID: $e");
      return ''; // Return an empty string in case of an error
    }
  }

  //CASH IN INCREMENT THE BALANCE
//this function kay mag update sa balance na field which is mag add si addedAmount ug balance field
  Future<void> updateBalance(String addedAmount, String userId) async {
    try {
      // Convert the added amount to a double
      double amountToAdd = double.parse(addedAmount);

      String mydocid = await getConsumer(userId);

      if (mydocid != null) {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference<Map<String, dynamic>> documentRef =
            firestore.collection('sample_ConsumerUsers').doc(mydocid);

        // Retrieve the current balance from Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await documentRef.get();

        if (documentSnapshot.exists) {
          // Get the current balance from the document
          double currentBalance = documentSnapshot.data()?['balance'] ?? 0.0;

          // Calculate the new balance by adding the added amount
          double newBalance = currentBalance + amountToAdd;

          // Update the 'balance' field in the Firestore document with the new balance
          await documentRef.update({
            'balance': newBalance,
          });

          print('Balance has been updated for user ID: $userId');
        } else {
          print('Document not found for user ID: $userId');
        }
      } else {
        print('Document ID retrieval failed for user ID: $userId');
      }
    } catch (e) {
      print("Error while updating balance: $e");
    }
  }

  //CASH OUT DECREMENT THE BALANCE
  //this function kay mag update sa balance na field which is mag add si addedAmount ug balance field
  Future<void> updateBalance1(String cashOutAmount, String userId) async {
    try {
      // Convert the minus amount to a double
      double amountCashOut = double.parse(cashOutAmount);

      String mydocid = await getConsumer(userId);

      if (mydocid != null) {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference<Map<String, dynamic>> documentRef =
            firestore.collection('sample_ConsumerUsers').doc(mydocid);

        // Retrieve the current balance from Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await documentRef.get();

        if (documentSnapshot.exists) {
          // Get the current balance from the document
          double currentBalance = documentSnapshot.data()?['balance'] ?? 0.0;

          // Calculate the new balance by decrementing the amountCashOut
          double newBalance = currentBalance - amountCashOut;

          // Update the 'balance' field in the Firestore document with the new balance
          await documentRef.update({
            'balance': newBalance,
          });

          print('Balance has been updated for user ID: $userId');
        } else {
          print('Document not found for user ID: $userId');
        }
      } else {
        print('Document ID retrieval failed for user ID: $userId');
      }
    } catch (e) {
      print("Error while updating balance: $e");
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

  //STATUS FOR CASH OUT
  //gikuha ang doc id sa user if nay request na cash out
  String mydocid = "";
  Future<String> getDocIdReq(String userid) async {
    String myuserid = userid;

    CollectionReference reference =
        FirebaseFirestore.instance.collection('sample_ConsumerWallet');
    QuerySnapshot query = await reference
        .where('userId', isEqualTo: userid)
        .where('request', isEqualTo: 'Cash Out')
        .get();

    if (query.docs.isNotEmpty) {
      DocumentSnapshot documentSnapshot = query.docs.first;
      mydocid = documentSnapshot.id;
    } else {
      print("No document found for user ID: $myuserid");
      throw ("Failed id retrieval");
    }
    return mydocid;
  }

  /*this function is to update the field status of the collection 
sample_farmer wallet for cash out
  */
  Future<void> updateStatus1(String? updatedata, String userid) async {
    /*Calling the getUpdateddocID function from the class UpdateRetrieve 
    reusing the class for retrieving doc id
    */
    await retrievewallet.getConsumerRequestCashOut(userid);

    final documentRef = FirebaseFirestore.instance
        .collection('sample_ConsumerWallet')
        .doc(retrievewallet.docid);

    // Define the data to update which is the account status
    final updateData = {
      'status': updatedata,
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
}
