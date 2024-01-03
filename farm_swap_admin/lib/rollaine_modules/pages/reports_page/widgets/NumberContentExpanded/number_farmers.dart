import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class NumberFarmers extends StatefulWidget {
  const NumberFarmers({
    super.key,
  });

  @override
  State<NumberFarmers> createState() => _NumberFarmersState();
}

class _NumberFarmersState extends State<NumberFarmers> {
  int totalFarmerUsers = 0;

  //Use the fetchFarmerUsers method to fetch the document snapshots in the 'FarmerUsers' collection and calculate the farmer users
  Future<void> fetchFarmerUsers() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Creates a CollectionReference named usersCollection, which is a reference to the Firestore collection named 'FarmerUsers'
      final CollectionReference usersCollection = firestore.collection('sample_FarmerUsers');

      //Fetches the data from the 'FarmerUsers' collection using the get method, which retrieves all documents within the collection
      final QuerySnapshot usersSnapshot = await usersCollection.get();

      //This code is to update the totalFarmerUsers variable with the count of documents in the usersSnapshot
      setState(() {
        totalFarmerUsers = usersSnapshot.size;
      });
    } catch (e) {
      print('Error fetching user count: $e');
    }
  }

  //Initiates the process of fetching data about farmer users.
  @override
  void initState() {
    super.initState();
    fetchFarmerUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 45, top: 10),
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

          //Content of container 3
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Farmers',
                      style: Poppins.commuTitle.copyWith(
                        color: const Color(0xFF09051C),
                      ),
                    ),
                    Text(
                      '$totalFarmerUsers',
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
    );
  }
}
