import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_notification_page/database/admin_notif_querry.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_notification_page/widgets/notification_searchbar.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../constants/Colors/colors_rollaine.dart';
import '../../dashboard_page/screens/dashboard_epxanded1_items.dart';

class AdminNotificationScreen extends StatefulWidget {
  const AdminNotificationScreen({super.key});

  @override
  State<AdminNotificationScreen> createState() => _AdminNotificationScreenState();
}

class _AdminNotificationScreenState extends State<AdminNotificationScreen> {
//Instance of the Notification querry class
  AdminNotificationQuerry notification = AdminNotificationQuerry();

  //Controller for search
  TextEditingController notifSearchController = TextEditingController();

  //a variable to hold the searched value
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /*First Expanded containing the side bar options */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                child: const DashBoardExpanded1Item(),
              ),
            ),
          ),
          /*The second expanded */
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                child: Scaffold(
                  /*App bar of the center container*/
                  appBar: AppBar(
                    toolbarHeight: 80,
                    title: Row(
                      children: [
                        /*Expanded for the word notification */
                        Expanded(
                          child: Text(
                            "Notifications",
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                        ),
                        /*App bar contains search bar */
                        Expanded(
                          child: NotificationSearchBar(controller: notifSearchController),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        /*Search button */
                        IconButton(
                          onPressed: () {
                            setState(
                              () {
                                /*Setting the state of search value variable becoz this will
                                 be used as a condition in displaying the searcheditem */
                                searchValue = notifSearchController.text;
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RoutesManager.dashboard);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    backgroundColor: farmSwapTitlegreen,
                    automaticallyImplyLeading: false,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Expanded(
                          child: _buildNotificationLists(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

/*Method taht will get every document in the AdminNotification collection and display its
contentts in a list view */
  Widget _buildNotificationLists() {
    return StreamBuilder<QuerySnapshot>(
      stream: notification.getAdminNotifications(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            children: snapshot.data!.docs.map((document) => _accessItemList(document)).toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

/*Method that will accesss every item of the document being passed here */
  Widget _accessItemList(DocumentSnapshot document) {
    Map<String, dynamic> items = document.data() as Map<String, dynamic>;
    //Converting the date into a string
    Timestamp timestamp = items["notifDate"];
    DateTime dateTime = timestamp.toDate();
    String finalTime = DateFormat('yyyy-MM-dd').format(dateTime);

    /*If there is a searched value in search bar then only display the searched item */
    if (searchValue.isNotEmpty) {
      if (searchValue == items["notifSenderName"] ||
          searchValue == finalTime ||
          searchValue.contains(items["notifMessage"])) {
        return ListTile(
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              /*PUTTING BOX SHADOW ON THE CONTAINER */
              boxShadow: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 2,
                  offset: const Offset(1, 5),
                ),
              ],
            ),
            /*Displaying the details */
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  SizedBox(
                    width: 500,
                    child: Text(
                      items["notifMessage"],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(items["notifSenderName"]),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      finalTime,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      /*If category is chat then redirect to the chat page */
                      if (items["notifCateogry"] == "CHAT") {
                        Navigator.of(context).pushNamed(RoutesManager.chatpage);
                      }
                    },
                    icon: const Icon(CupertinoIcons.eye_solid),
                    color: farmSwapSmoothGreen,
                  ),
                ],
              ),
            ),
          ),
        );
      }
      /*If search bar empty then display every notification */
    } else {
      return ListTile(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            /*PUTTING BOX SHADOW ON THE CONTAINER */
            boxShadow: [
              BoxShadow(
                color: shadow,
                blurRadius: 2,
                offset: const Offset(1, 5),
              ),
            ],
          ),
          /*Displaying the details */
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(
                  width: 500,
                  child: Text(
                    items["notifMessage"],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 200,
                  child: Text(items["notifSenderName"]),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    finalTime,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    /*If category is chat then redirect to the chat page */
                    if (items["notifCateogry"] == "CHAT") {
                      Navigator.of(context).pushNamed(RoutesManager.chatpage);
                    }
                  },
                  icon: const Icon(CupertinoIcons.eye_solid),
                  color: farmSwapSmoothGreen,
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container();
  }
}
