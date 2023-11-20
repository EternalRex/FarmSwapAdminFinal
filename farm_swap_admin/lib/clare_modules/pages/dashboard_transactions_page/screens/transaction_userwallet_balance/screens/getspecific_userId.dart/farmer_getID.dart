import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/transaction_userwallet_balance/provider/Specific_walletUser_details_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wrapper/farmerwallet_details.dart';

// ignore: must_be_immutable
class SpecificWalletFarmerUserID extends StatelessWidget {
  SpecificWalletFarmerUserID({super.key});

  String _userID = "";

//create a object to access into getcurrentadminID class
  GetCurrentFarmerUserID getCurrentfarmerID = GetCurrentFarmerUserID();

  @override
  Widget build(BuildContext context) {
    _userID = Provider.of<SpecificWalletDetailsProvider>(context).getUserId();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getCurrentfarmerID.getFarmerUserId(_userID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String data = snapshot.data!;

              //if the data has id
              //the documentID which is naa nay data
              //pass into  SpecificWalletDetails wrapper
              return SpecificWalletDetailsFarmer(documentID: data);
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}

//getting the curretn user Id for the farmer
class GetCurrentFarmerUserID {
  //Create a varible that will hold the id that we get
  String? documentId;
  //create an object of the firestore
  FirebaseFirestore database = FirebaseFirestore.instance;

  //Future method that will return a String]
  Future<String?> getFarmerUserId(String data) async {
    String currentUserId = data;
    await database
        .collection("sample_FarmerUsers")
        .where("userId", isEqualTo: currentUserId)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              documentId = element.reference.id;
            },
          ),
        );
    return documentId;
  }
}
