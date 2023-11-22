import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class SellingContentTitle extends StatefulWidget {
  const SellingContentTitle({super.key});

  @override
  State<SellingContentTitle> createState() => _SellingContentTitleState();
}

class _SellingContentTitleState extends State<SellingContentTitle> {

  int totalSell = 0;

  //Use the fetchFarmerUsers method to fetch the document snapshots in the 'FarmerUsers' collection and calculate the farmer users
  Future<void> fetchSell() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Creates a CollectionReference named usersCollection, which is a reference to the Firestore collection named 'FarmerUsers'
      final CollectionReference sellCollection = firestore.collection('sample_SellingTransactions');

      //Fetches the data from the 'FarmerUsers' collection using the get method, which retrieves all documents within the collection
      final QuerySnapshot sellSnapshot = await sellCollection.get();

      //This code is to update the totalFarmerUsers variable with the count of documents in the usersSnapshot
      setState(() {
        totalSell = sellSnapshot.size;
      });
    } catch (e) {
      print('Error fetching sell count: $e');
    }
  }

  //Initiates the process of fetching data about farmer users.
  @override
  void initState() {
    super.initState();
    fetchSell();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 25),
          child: Row(
            children: [
              //Content Title
              Text(
                'Sell Transactions Record',
                style: Poppins.contentTitle.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: Row(
            children: [
              Text(
                'Total Sells:',
                style: Poppins.contentText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$totalSell',
                style: Poppins.contentText.copyWith(
                  color: greenNormal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
