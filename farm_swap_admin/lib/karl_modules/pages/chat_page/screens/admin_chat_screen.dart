import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/admin_actual_chat.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_chat_searchBar.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/chat_display_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/Colors/colors_rollaine.dart';

class AdminChatScreen extends StatefulWidget {
  const AdminChatScreen({super.key});

  @override
  State<AdminChatScreen> createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  /*Search functionality properties */
  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const DashBoardTitleText(
          myText: "Admin Chat",
          myColor: Colors.black,
        ),
        actions: [
          /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
          Padding(
            padding: const EdgeInsets.all(10),
            /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                      HEIGH AND WIDTH OF THE TEXT FIELD */
            child: SizedBox(
              width: 250,
              height: 15,
              /*Contains the search bar*/
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: AdminChatSearchBar(
                      controller: searchController,
                    ),
                  ),
                  /*Search functionality */
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchValue = searchController.text;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFFDA6317),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: _buildUserList(),
      ),
    );
  }

/* */
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('AdminUsers').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView(
              /*We are getting all the list of documents in the firebase, and each document like one
              by one, the documents will passed to the _buildUserListItems */
              children: snapshot.data!.docs
                  .map<Widget>((document) => _buildUserListItems(document))
                  .toList(),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildUserListItems(DocumentSnapshot document) {
    /*We are accessing a document that was passed here one by one, and map it into 
    String and dynamic, to look the same in the firebase strcuture */
    Map<String, dynamic> users = document.data() as Map<String, dynamic>;
    bool isOnline = users["Online"];
/*Only the specific account searched will display*/
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (users["First Name"].toString().toLowerCase() ==
              searchValueLowerCase ||
          users["Last Name"].toString().toLowerCase() == searchValueLowerCase ||
          users["Email Address"].toString().toLowerCase() ==
              searchValueLowerCase) {
        return ListTile(
          title: Container(
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
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider("${users["profileUrl"]}"),
                  radius: 30,
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 100,
                  child:
                      ChatAllDisplayUserTexts(text: "${users["First Name"]}"),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 130,
                  child: ChatAllDisplayUserTexts(text: "${users["Last Name"]}"),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 250,
                  child: ChatAllDisplayUserTexts(
                      text: "${users["Email Address"]}"),
                ),
                const SizedBox(
                  width: 30,
                ),
                (isOnline == true)
                    ? Text(
                        "Online",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.green,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    : Text(
                        "Offline",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
              ],
            ),
          ),
          /*When tapping that particular row of user we will send that users id and email
        address to the next screen which is the AsminActual Screen */
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return AdminActualChat(
                    receiverId: users["User Id"],
                    receiverFname: users["First Name"],
                    receiverLname: users["Last Name"],
                    receiverImage: users["profileUrl"],
                    isOnline: users["Online"],
                    receiverEmail: users["Email Address"],
                  );
                },
              ),
            );
          },
        );
      }
    }
    /* else if search bar is empty Check if the documents that we accessed has an eamil that is not simillar to the current users email
    because we will not display the current user here only those other users*/
    else if (FirebaseAuth.instance.currentUser!.email !=
        users['Email Address']) {
      /*The actual display and styling is done here inside the listile */
      return ListTile(
        /*Pull outing the data from the firestore document and designing how it will look in the ui*/
        title: Container(
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
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider("${users["profileUrl"]}"),
                radius: 30,
              ),
              const SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 100,
                child: ChatAllDisplayUserTexts(text: "${users["First Name"]}"),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 130,
                child: ChatAllDisplayUserTexts(text: "${users["Last Name"]}"),
              ),
              const SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 250,
                child:
                    ChatAllDisplayUserTexts(text: "${users["Email Address"]}"),
              ),
              const SizedBox(
                width: 30,
              ),
              (isOnline == true)
                  ? Text(
                      "Online",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  : Text(
                      "Offline",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
            ],
          ),
        ),
        /*When tapping that particular row of user we will send that users id and email
        address to the next screen which is the AsminActual Screen */
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return AdminActualChat(
                  receiverId: users["User Id"],
                  receiverFname: users["First Name"],
                  receiverLname: users["Last Name"],
                  receiverImage: users["profileUrl"],
                  isOnline: users["Online"],
                  receiverEmail: users["Email Address"],
                );
              },
            ),
          );
        },
      );
    }
    return Container();
  }
}
