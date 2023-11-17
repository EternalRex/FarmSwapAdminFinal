// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateBalance {
  //getting the document id
  Future<String> getDocId(String userId) async {
    try {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('sample_FarmerUsers');
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

  //update balance with the added balance amount
//this function kay mag update sa balance na field which is mag add si addedAmount ug balance field
  Future<void> updateBalance(String addedAmount, String userId) async {
    try {
      // Convert the added amount to a double
      double amountToAdd = double.parse(addedAmount);

      String mydocid = await getDocId(userId);

      if (mydocid != null) {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference<Map<String, dynamic>> documentRef =
            firestore.collection('sample_FarmerUsers').doc(mydocid);

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

  //update balance with the deducted balance amount
//this function kay mag update sa balance na field which is mag minus si dedcuted amount ug balance field
  Future<void> updateBalanceDeduct(String deductedAmount, String userId) async {
    try {
      // Convert the added amount to a double
      double deduct = double.parse(deductedAmount);

      String mydocid = await getDocId(userId);

      if (mydocid != null) {
        final FirebaseFirestore firestore = FirebaseFirestore.instance;
        final DocumentReference<Map<String, dynamic>> documentRef =
            firestore.collection('sample_FarmerUsers').doc(mydocid);

        // Retrieve the current balance from Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
            await documentRef.get();

        if (documentSnapshot.exists) {
          // Get the current balance from the document
          double currentBalance = documentSnapshot.data()?['balance'] ?? 0.0;

          // Calculate the new balance by deducting the current balance
          double newBalance = currentBalance - deduct;

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
}

class CheckBalance {
  UpdateBalance retrieve = UpdateBalance();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  /*this function kay para kuhaon ang balance sa firestore then gi convert into double */
  Future<double> getBalanceFromFirestore(String userId) async {
    try {
      String documentId = await retrieve.getDocId(userId);
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('sample_FarmerUsers')
          .doc(documentId)
          .get();
      final dynamic data = documentSnapshot.data();

      if (documentSnapshot.exists) {
        final balance = (data['balance'] as double?)?.toDouble() ?? 0.0;
        return balance;
      } else {
        print('Firestore error: $documentId');
        return 0.0; // Default value if the document doesn't exist
      }
    } catch (e) {
      // Handle any Firestore errors here
      print('Firestore error: $e');
      return 0.0; // Default value in case of an error
    }
  }
}
