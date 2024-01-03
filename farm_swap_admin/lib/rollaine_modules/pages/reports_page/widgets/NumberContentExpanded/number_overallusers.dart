import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class NumberOverallUsers extends StatefulWidget {
  const NumberOverallUsers({
    super.key,
  });

  @override
  State<NumberOverallUsers> createState() => _NumberOverallUsersState();
}

class _NumberOverallUsersState extends State<NumberOverallUsers> {
  int totalOverallUsers = 0;
  int totalFarmerUsers = 0;
  int totalConsumerUsers = 0;

  //Use the fetchOverallUsers method to fetch the document snapshots of two collections and calculate the overall users.
  Future<void> fetchOverallUsers() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //These lines create references to two Firestore collections, collection1 and collection2
      final CollectionReference collection1 =
          firestore.collection('sample_FarmerUsers');
      final CollectionReference collection2 =
          firestore.collection('sample_ConsumerUsers');

      //These lines execute queries on the collection1 and collection2 collections and retrieve all the documents within each collection.
      final QuerySnapshot collection1Snapshot = await collection1.where(
          'accountStatus',
          whereIn: ['Active', 'ACTIVE', 'Requesting']).get();
      final QuerySnapshot collection2Snapshot = await collection2
          .where('accountStatus', whereIn: ['ACTIVE', 'REQUESTING']).get();

      //These lines count the number of documents in each of the collections by accessing the size property of the QuerySnapshot objects. The size property represents the number of documents in the collection.
      final int overallUsers1 = collection1Snapshot.size;
      final int overallUsers2 = collection2Snapshot.size;

      //The overall users are summed up and stored in the totalOverallUsers
      setState(() {
        totalFarmerUsers = overallUsers1;
        totalConsumerUsers = overallUsers2;
        totalOverallUsers = overallUsers1 + overallUsers2;
      });
    } catch (e) {
      print('Error fetching user counts: $e');
    }
  }

  //Initiates the process of fetching data about overall users
  @override
  void initState() {
    super.initState();
    fetchOverallUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 45, top: 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: showUserCountsDialog,
            child: Container(
              height: 190,
              //Designing the container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),

                //Box shadow of the container
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 2,
                    offset: const Offset(1, 5),
                  ),
                ],
              ),

              //Content of container 1
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Overall Users',
                          style: Poppins.commuTitle.copyWith(
                            color: const Color(0xFF09051C),
                          ),
                        ),
                        Text(
                          '$totalOverallUsers',
                          style: Poppins.number.copyWith(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: <Color>[
                                  Color(0xFF53E78B),
                                  Color(0xFF14BE77),
                                ],
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to show the user count dialog
  void showUserCountsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'User Counts',
            style: Poppins.discText.copyWith(
              color: greenNormal,
            ),
          ),
          content: SizedBox(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Farmer Users: $totalFarmerUsers'),
                Text('Consumer Users: $totalConsumerUsers'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              child: Text(
                'Close',
                style: Poppins.farmerName.copyWith(
                  color: greenNormal,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
