import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class NumberConsumers extends StatefulWidget {
  const NumberConsumers({
    super.key,
  });

  @override
  State<NumberConsumers> createState() => _NumberConsumersState();
}

class _NumberConsumersState extends State<NumberConsumers> {
  int totalCustomerUsers = 0;
  int activeConsumerUsers = 0;
  int requestingConsumerUsers = 0;

  //Use the fetchCustomerUsers method to fetch the document snapshots in the 'CustomerUsers' collection and calculate the customer users
  Future<void> fetchCustomerUsers() async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Creates a CollectionReference named usersCollection, which is a reference to the Firestore collection named 'CustomerUsers'
      final CollectionReference usersCollection =
          firestore.collection('sample_ConsumerUsers');

      //Fetches the data from the 'CustomerUsers' collection using the get method, which retrieves all documents within the collection
      final QuerySnapshot usersSnapshot = await usersCollection.where('accountStatus', whereIn: ['ACTIVE', 'REQUESTING']).get();

      setState(() {
        totalCustomerUsers = usersSnapshot.size;
        activeConsumerUsers = usersSnapshot.docs
            .where((doc) => doc['accountStatus'] == 'ACTIVE')
            .length;
        requestingConsumerUsers = usersSnapshot.docs
            .where((doc) => doc['accountStatus'] == 'REQUESTING')
            .length;
      });
    } catch (e) {
      print('Error fetching user count: $e');
    }
  }

  //Initiates the process of fetching data about customer users.
  @override
  void initState() {
    super.initState();
    fetchCustomerUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 45, top: 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: showConsumerDetailsDialog,
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
          
              //Content of container 4
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
                          'Consumers',
                          style: Poppins.commuTitle.copyWith(
                            color: const Color(0xFF09051C),
                          ),
                        ),
                        Text(
                          '$totalCustomerUsers',
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
  void showConsumerDetailsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Consumer Users',
            style: Poppins.discText.copyWith(
              color: greenNormal,
            ),
          ),
          content: SizedBox(
            height: 70,
            child: SizedBox(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Active Consumers: $activeConsumerUsers'),
                  Text('Requesting Consumers: $requestingConsumerUsers'),
                ],
              ),
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
