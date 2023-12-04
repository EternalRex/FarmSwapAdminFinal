import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DecemberRevenueTabBarView extends StatefulWidget {
  const DecemberRevenueTabBarView({super.key});

  @override
  State<DecemberRevenueTabBarView> createState() =>
      _DecemberRevenueTabBarViewState();
}

TextEditingController searchController = TextEditingController();
String searchValue = "";

class _DecemberRevenueTabBarViewState extends State<DecemberRevenueTabBarView> {
  String selectedYear = "Overall"; // Default selected year
  List<String> availableYears = [
    "2023",
    "2024",
    "2025",
    "2026",
  ]; // Add your available years here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        height: 800,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 2,
              offset: const Offset(1, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            /*this will align to center left where the container is
            the container has the monthly revenue for the farmswaps wallet*/
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  //this container holds the value of the monthly revenue for the admins wallet
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: ShapeDecoration(
                          color: greenNormal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              blurRadius: 2,
                              color: shadow,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Revenue of the Month December',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('sample_SwapCoinsLogs')
                                  .where('status', isEqualTo: 'COMPLETED')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }

                                // Extract the documents from the snapshot
                                List<DocumentSnapshot> documents =
                                    snapshot.data!.docs;

                                // Filter documents for January
                                List<DocumentSnapshot> januaryDocuments =
                                    documents.where((document) {
                                  //creating a variable for the dateTime field where it is in the document
                                  DateTime timestamp =
                                      document['dateTime'].toDate();
                                  return timestamp.month ==
                                      12; // 1 represents January
                                }).toList();

                                // Calculate the sum of swapcoins for specific month using fold
                                double sum = januaryDocuments.fold(0.0,
                                    (previousValue, document) {
                                  // creating a variable for the swapcoins field
                                  double swapcoins =
                                      document['swapcoins'] ?? 0.0;
                                  return previousValue + swapcoins;
                                });

                                // Displaying the sum of swapcoins for the month of january where status is COMPLETED
                                return Text(
                                  // Format the sum as a string with 2 decimal places
                                  '₱ ${sum.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  //this container para sa pag select sa year
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 120, // Adjust the width as needed
                      height: 40, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 111, 221, 107),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: shadow,
                            blurRadius: 2,
                            offset: const Offset(1, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: DropdownButton<String>(
                            value: selectedYear,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedYear = newValue!;
                              });
                            },
                            items: [
                              'Overall',
                              ...availableYears
                            ] // Add 'Overall' to the beginning of the list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      value,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: value == 'Overall'
                                            ? Colors.white
                                            : Colors.black,
                                        // Text color
                                        fontSize: 16, // Text size
                                        fontWeight: value == 'Overall'
                                            ? FontWeight.normal
                                            : FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            style: const TextStyle(
                              color: Colors.black, // Dropdown button text color
                              fontSize: 16, // Dropdown button text size
                            ),
                            dropdownColor:
                                Colors.white, // Dropdown list background color
                            underline:
                                Container(), // Remove the default underline
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white, // Dropdown icon color
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //this holds the search value and selected year value
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: greenLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Date and Time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "SwapCoins",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //call the builder list
            SingleChildScrollView(
              child: SizedBox(
                height: 270,
                child: _buildRevenueList(selectedYear),
                //_buildJanuaryRevenueList(selectedYear),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueList(String selectedYear) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_SwapCoinsLogs')
          .where('status', isEqualTo: 'COMPLETED')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: greenNormalHover,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final logs = snapshot.data!.docs;

          if (logs.isEmpty) {
            return const Center(
              child: Text('No revenue reports available!'),
            );
          }

          // Filter logs for the selected year and december
          final selectedYearLogs = logs.where((document) {
            var dateTime = document['dateTime'];
            if (dateTime is Timestamp) {
              dateTime = dateTime.toDate();
            }
            return (selectedYear == 'Overall' ||
                    (dateTime as DateTime).year.toString() == selectedYear) &&
                (dateTime as DateTime).month == DateTime.december;
          }).toList();

          // This will display if there are no logs for this month
          if (selectedYearLogs.isEmpty) {
            return const Center(
              child: Text('No revenue reports available for December!'),
            );
          }

          // This will sort the selected year logs based on the 'dateTime' field
          selectedYearLogs.sort((a, b) {
            var dateTimeA = a['dateTime'];
            var dateTimeB = b['dateTime'];

            if (dateTimeA is Timestamp) {
              dateTimeA = dateTimeA.toDate();
            }

            if (dateTimeB is Timestamp) {
              dateTimeB = dateTimeB.toDate();
            }

            return (dateTimeB as DateTime).compareTo(dateTimeA as DateTime);
          });

          return ListView(
            children: selectedYearLogs.map<Widget>((document) {
              return _buildRevenueListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildRevenueListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["dateTime"];
    DateTime dateTime = dateTimestamp.toDate();
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
    String timeListTile = DateFormat('hh:mm a').format(dateTime);

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["swapcoins"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          data["address"].toString().toLowerCase() == searchValueLowerCase ||
          data["dateTime"].toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: Container(
            width: 1000,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                //this expanded holding the profilepic, firstname, last name and address of the user
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      CachedNetworkImage(
                        imageUrl: data["profile"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
                          print("Error loading image: $error");
                          return const Icon(Icons.error);
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${data["firstname"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                " ${data["lastname"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                " ${data["address"]}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //this holds the date and time
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateFinal,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        timeListTile,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                //this holds the swapcoins amount purchased
                Expanded(
                  flex: 2,
                  child: Text(
                    "${data["swapcoins"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    //if search bar is empty this one will display
    else {
      return ListTile(
        title: Container(
          width: 1000,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              //this expanded holding the profilepic, firstname, last name and address of the user
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),

                    //this will display the users profile picture in each listtile
                    CachedNetworkImage(
                      imageUrl: data["profile"] ??
                          "", // Provide a default empty string if it's null
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 20,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) {
                        print("Error loading image: $error");
                        return const Icon(Icons.error);
                      },
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${data["firstname"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              " ${data["lastname"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              " ${data["address"]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //this holds the date and time
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateFinal,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      timeListTile,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              //this holds the swapcoins amount purchased
              Expanded(
                flex: 2,
                child: Text(
                  "${data["swapcoins"]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
