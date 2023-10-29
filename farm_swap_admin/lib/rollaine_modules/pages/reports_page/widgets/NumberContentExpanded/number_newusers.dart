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

  //Initializes a variable totalNewUsers to keep track of the total number of newly registered users
  int totalNewUsers = 0;

  Future<void> fetchNewUsers() async {
    try {

      //Initializes the Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      //Initialize references to two Firestore collections: 'FarmerUsers' and 'CustomerUsers'. 
      final CollectionReference collection1 = firestore.collection('sample_FarmerUsers');
      final CollectionReference collection2 = firestore.collection('sample_ConsumerUsers');

      //Gets the current date and time and assigns it to a DateTime variable named today.
      final DateTime today = DateTime.now();

      //Used to keep track of the count of newly registered users
      int newUsers = 0;

      /*fetchAndCountNewUsers function for the first collection ('collection1') and 
      waiting for the result. After the function completes, it uses a .then() callback 
      to add the count returned by fetchAndCountNewUsers to the newUsers variable*/
      await fetchAndCountNewUsers(collection1, today).then((count) {
        newUsers += count;
      });

      /*fetchAndCountNewUsers function for the second collection ('collection2') and 
      waiting for the result. After the function completes, it uses a .then() callback 
      to add the count returned by fetchAndCountNewUsers to the newUsers variable*/
      await fetchAndCountNewUsers(collection2, today).then((count) {
        newUsers += count;
      });

      //Update the Flutter widget's state
      setState(() {
        totalNewUsers = newUsers;
      });
    } catch (e) {
      print('Error fetching new users count: $e');
    }
  }

  Future<int> fetchAndCountNewUsers(CollectionReference collection, DateTime today) async {

    //Fetches the documents from the specified Firestore collection (collection) using the get method.
    final QuerySnapshot collectionSnapshot = await collection.get();

    //Used to keep track of the count of newly registered users within the collection
    int newUsers = 0;

    /*Each iteration processes one Firestore document, and doc 
    represents the current document being processed.*/
    for (QueryDocumentSnapshot doc in collectionSnapshot.docs) {

      //Extracts the data from the Firestore document
      final data = doc.data() as dynamic;

      //Extracts the "registrationDate" field from the data
      final Timestamp timestamp = data["registrationDate"];

      //This DateTime object represents the registration date of the user stored in Firestore.
      final DateTime registrationDate =timestamp.toDate();

      /*The code calculates the duration between the current date (today) and the user's 
      registration date (registrationDate). */
      final Duration difference = today.difference(registrationDate);

      //It's determining if the user's registration occurred within the last 7 days.
      if (difference.inDays <= 7) {

        //Increments the newUsers count by 1.
        newUsers++;
      }
    }

    /*Returns the value of the newUsers variable, which represents the count of newly 
    registered users within the Firestore collection*/
    return newUsers;
  }

  /*Responsible for initiating the process of fetching and counting new users when 
  the widget is first inserted into the widget tree.*/
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