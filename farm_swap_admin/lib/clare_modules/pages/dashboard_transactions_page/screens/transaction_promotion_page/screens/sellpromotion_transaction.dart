import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SellPromotiomTabBarView extends StatefulWidget {
  SellPromotiomTabBarView({super.key, this.documentID});
  final String? documentID;
  String selectedId = "";

  @override
  State<SellPromotiomTabBarView> createState() =>
      _SellPromotiomTabBarViewState();
}

TextEditingController searchController = TextEditingController();
String searchValue = "";

class _SellPromotiomTabBarViewState extends State<SellPromotiomTabBarView> {
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
            const SizedBox(
              height: 20,
            ),

            Row(
              children: [
                //header text
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Sell Promotion Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF09041B),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0.07,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 320,
                ),

                //this align is for the container of the search textfield
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 35,
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          controller: searchController,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFDA6317),
                            height: 1.5,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            filled: true,
                            fillColor:
                                const Color(0xFFF9A84D).withOpacity(0.10),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search here',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xFFDA6317),
                              size: 18,
                            ),
                            prefixIconColor: const Color(0xFFDA6317),
                          ),
                          onSubmitted: (value) {
                            setState(() {
                              searchValue = searchController.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            //this will display the header
            Container(
              width: 780,
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      "Date & Time",
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
                      "Status",
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

            const SizedBox(
              height: 10,
            ),

            //call the builder list for consumer
            Container(
              width: 780,
              height: 320,
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 500,
                  child: _buildSellPromotionList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSellPromotionList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('sample_PromotionListings')
          .where('status', isEqualTo: 'PROMOTED')
          .where('listingCategory', isEqualTo: 'SELL')
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
              child: Text('No sell promotion available!'),
            );
          }

          // This will sort the documents based on the 'dateTime' field
          logs.sort((a, b) {
            var dateTimeA = a['listingStartDate'];
            var dateTimeB = b['listingStartDate'];

            //This will check if the dateTime field is a Timestamp and convert to DateTime
            if (dateTimeA is Timestamp) {
              dateTimeA = dateTimeA.toDate();
            }

            if (dateTimeB is Timestamp) {
              dateTimeB = dateTimeB.toDate();
            }
            // this will perform the descending order base on the date and its time
            return (dateTimeB as DateTime).compareTo(dateTimeA as DateTime);
          });

          return ListView(
            children: logs.map<Widget>((document) {
              return _buildSellPromotionListItems(document);
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildSellPromotionListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */

    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Timestamp dateTimestamp = document["listingStartDate"];
    Timestamp dateTimestamp1 = document["listingEndDate"];
    DateTime dateTime = dateTimestamp.toDate();
    DateTime dateTime1 = dateTimestamp1.toDate();
    String dateFinal = DateFormat('MMMM d, y').format(dateTime);
    String dateMonth = DateFormat('MMMM').format(dateTime);
    String timeListTile = DateFormat('hh:mm a').format(dateTime);
    String dateFinal1 = DateFormat('MMMM d, y').format(dateTime1);
    String timeListTile1 = DateFormat('hh:mm a').format(dateTime1);

    //the searched transaction will display here
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (data["status"].toString().toLowerCase() == searchValueLowerCase ||
          data["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          data["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          data["address"].toString().toLowerCase() == searchValueLowerCase ||
          dateFinal.toString().toLowerCase() == searchValueLowerCase ||
          dateMonth.toString().toLowerCase() == searchValueLowerCase) {
        return ListTile(
          title: Container(
            width: 750,
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
            child: GestureDetector(
              child: Row(
                children: [
                  //this expanded holding the profilepic, firstname, last name and address of the user
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),

                        //this will display the users profile picture in each listtile
                        CachedNetworkImage(
                          imageUrl: document["profilePhoto"] ??
                              "", // Provide a default empty string if it's null
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 20,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) {
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
                      " ${data["status"]}",
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Container(
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            5,
                          )),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x21000000),
                              blurRadius: 10,
                              offset: Offset(6, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Promotion Details',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.50,
                            ),
                          ),
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: SizedBox(
                          height: 600,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),

                              //row for type of promotion just calling the listingCategory from the db
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Promotion for : ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["listingCategory"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for type of promotion just calling the listingCategory from the db
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "User ID : ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["userId"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user name
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Name: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["firstname"]} " +
                                          "${document["lastname"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user address
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Address: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["address"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion fee
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Promotion Fee: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["fee"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion start date
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Promotion Started: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      " $dateFinal $timeListTile",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion enda date
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Promotion Ended: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      " $dateFinal1 $timeListTile1",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              //row for the promotion product picture
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Listing Item: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: CachedNetworkImage(
                                      imageUrl: data["listingPicture"] ?? "",
                                      imageBuilder: (context, imageProvider) =>
                                          ClipRect(
                                        child: Container(
                                          width: 150, // Set the desired width
                                          height: 200, // Set the desired height
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                10), // Set your desired border radius
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion listing name
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Listing Name: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["listingName"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion listing description
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Listing Description: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["listingDescription"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion listing qty
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Listing Quantity: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["listingQuantity"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              //row for user promotion listing value
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Listing Price: ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "${document["listingPrice"]} ",
                                      style: Poppins.adminName.copyWith(
                                        color: const Color(0xFF09041B),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Close the second AlertDialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      }
    }

    //if search bar is empty this one will display
    else {
      return ListTile(
        title: Container(
          width: 750,
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
          child: GestureDetector(
            child: Row(
              children: [
                //this expanded holding the profilepic, firstname, last name and address of the user
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 50,
                      ),

                      //this will display the users profile picture in each listtile
                      CachedNetworkImage(
                        imageUrl: document["profilePhoto"] ??
                            "", // Provide a default empty string if it's null
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 20,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) {
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
                    " ${data["status"]}",
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
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          5,
                        )),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x21000000),
                            blurRadius: 10,
                            offset: Offset(6, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Promotion Details',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.50,
                          ),
                        ),
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: SizedBox(
                        height: 600,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),

                            //row for type of promotion just calling the listingCategory from the db
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Promotion for : ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["listingCategory"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for type of promotion just calling the listingCategory from the db
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "User ID : ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["userId"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user name
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Name: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["firstname"]} " +
                                        "${document["lastname"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user address
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Address: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["address"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion fee
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Promotion Fee: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["fee"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion start date
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Promotion Started: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    " $dateFinal $timeListTile",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion enda date
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Promotion Ended: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    " $dateFinal1 $timeListTile1",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            //row for the promotion product picture
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Listing Item: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: CachedNetworkImage(
                                    imageUrl: data["listingPicture"] ?? "",
                                    imageBuilder: (context, imageProvider) =>
                                        ClipRect(
                                      child: Container(
                                        width: 150, // Set the desired width
                                        height: 200, // Set the desired height
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10), // Set your desired border radius
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) {
                                      return const Icon(Icons.error);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion listing name
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Listing Name: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["listingName"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion listing description
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Listing Description: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["listingDescription"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion listing qty
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Listing Quantity: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["listingQuantity"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //row for user promotion listing value
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    "Listing Price: ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "${document["listingPrice"]} ",
                                    style: Poppins.adminName.copyWith(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Close"),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Close the second AlertDialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      );
    }

    return Container();
  }
}
