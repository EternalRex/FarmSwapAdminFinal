import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class BarterContentTitle extends StatefulWidget {
  const BarterContentTitle({
    super.key,
  });

  @override
  State<BarterContentTitle> createState() => _BarterContentTitleState();
}

class _BarterContentTitleState extends State<BarterContentTitle> {
  int totalBarters = 0;

  //Use the fetchFarmerUsers method to fetch the document snapshots in the 'FarmerUsers' collection and calculate the farmer users
  Future<void> fetchBarters() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Creates a CollectionReference named usersCollection, which is a reference to the Firestore collection named 'FarmerUsers'
      final CollectionReference bartersCollection = firestore.collection('sample_BarterTransactions');

      //Fetches the data from the 'FarmerUsers' collection using the get method, which retrieves all documents within the collection
      final QuerySnapshot bartersSnapshot = await bartersCollection.get();

      //This code is to update the totalFarmerUsers variable with the count of documents in the usersSnapshot
      setState(() {
        totalBarters = bartersSnapshot.size;
      });
    } catch (e) {
      print('Error fetching barter count: $e');
    }
  }

  //Initiates the process of fetching data about farmer users.
  @override
  void initState() {
    super.initState();
    fetchBarters();
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
                'Barter Transactions Record',
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
                'Total Barter:',
                style: Poppins.contentText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$totalBarters',
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
