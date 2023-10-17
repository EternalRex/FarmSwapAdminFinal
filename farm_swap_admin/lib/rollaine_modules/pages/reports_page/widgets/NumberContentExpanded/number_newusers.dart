import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class NumberNewUsers extends StatefulWidget {
  const NumberNewUsers({
    super.key,
  });

  @override
  State<NumberNewUsers> createState() => _NumberNewUsersState();
}

class _NumberNewUsersState extends State<NumberNewUsers> {

  int totalNewUsers = 0;

  //Use the fetchNewUsers method to fetch the document snapshots of two collections and calculate the number of newly added users in both collections
  Future<void> fetchNewUsers() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //These lines create references to two Firestore collections, collection1 and collection2
      final CollectionReference collection1 = firestore.collection('FarmerUsers');
      final CollectionReference collection2 = firestore.collection('CustomerUsers');

      //Executing these two lines of code, you'll have the data from both collection1 and collection2 available in the respective collection1Snapshot and collection2Snapshot variables
      final QuerySnapshot collection1Snapshot = await collection1.get();
      final QuerySnapshot collection2Snapshot = await collection2.get();

      final DateTime today = DateTime.now();
      // Threshold in days for "new" users.
      const int registrationThreshold = 7;

      //This code counts the number of documents in collection1 where the registration date is within a certain time frame (determined by registrationThreshold)
      final int newUsersCollection1 = collection1Snapshot.docs.where((doc) {
        final DateTime registrationDate = (doc.data() as Map) ['registrationDate'].toDate();
        final Duration difference = today.difference(registrationDate);
        return difference.inDays <= registrationThreshold;
      }).length;
      final int newUsersCollection2 = collection2Snapshot.docs.where((doc) {
        final DateTime registrationDate = (doc.data() as Map) ['registrationDate'].toDate();
        final Duration difference = today.difference(registrationDate);
        return difference.inDays <= registrationThreshold;
      }).length;

      //The new users are summed up and stored in the totalNewUsers
      setState(() {
        totalNewUsers = newUsersCollection1 + newUsersCollection2;
      });
    } catch (e) {
      print('Error fetching new users count: $e');
    }
  }

  //Initiates the fetching of new users' count, presumably to populate the widget's initial state with this data
  @override
  void initState() {
    super.initState();
    fetchNewUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 45, top: 10),
        child: Container(
          height: 190,
          //Designing the container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.all(
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

          //Content of container 2
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'New Users',
                      style: Poppins.commuTitle
                          .copyWith(
                        color: const Color(
                            0xFF09051C),
                      ),
                    ),
                    Text(
                      '$totalNewUsers',
                      style: Poppins.number
                          .copyWith(
                        foreground: Paint()
                          ..shader =
                              const LinearGradient(
                            colors: <Color>[
                              Color(0xFF53E78B),
                              Color(0xFF14BE77),
                            ],
                          ).createShader(
                            const Rect.fromLTWH(
                                0.0,
                                0.0,
                                200.0,
                                70.0),
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
    );
  }
}