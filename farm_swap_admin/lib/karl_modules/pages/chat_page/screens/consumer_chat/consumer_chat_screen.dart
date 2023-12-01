import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/consumer_chat/consumer_actual_chat.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/chat_display_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/consumer_chat_searchbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';

class ConsumerChatScreen extends StatefulWidget {
  const ConsumerChatScreen({super.key});

  @override
  State<ConsumerChatScreen> createState() => _ConsumerChatScreenState();
}

class _ConsumerChatScreenState extends State<ConsumerChatScreen> {
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
          myText: "Consumer Chat",
          myColor: Colors.black,
        ),
        actions: const [
          /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
          Padding(
            padding: EdgeInsets.all(10),
            /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                      HEIGH AND WIDTH OF THE TEXT FIELD */
            child: SizedBox(
              width: 250,
              height: 15,
              /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                        IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
              child: ConsumerChatSearchBar(),
            ),
          ),
          SizedBox(
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

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('sample_ConsumerUsers').snapshots(),
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
    bool isOnline = users["isOnline"];
    String consumerName = users['firstname'];
    String consumerLname = users['lastname'];
    String consumerEmail = users['email'];
    String consumerUname = users['userName'];
    String consumerID = users['userId'];
    String profilePhoto = users['profilePhoto'];
/*Only the specific account searched will display*/
    if (searchValue.isNotEmpty) {
      // Convert search value to lowercase
      String searchValueLowerCase = searchValue.toLowerCase();

      if (users["firstname"].toString().toLowerCase() == searchValueLowerCase ||
          users["lastname"].toString().toLowerCase() == searchValueLowerCase ||
          users["email"].toString().toLowerCase() == searchValueLowerCase ||
          users["userName"].toString().toLowerCase() == searchValueLowerCase) {
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
                  backgroundImage: CachedNetworkImageProvider("${users["profilePhoto"]}"),
                  radius: 30,
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 100,
                  child: ChatAllDisplayUserTexts(text: "${users["firstname"]}"),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 130,
                  child: ChatAllDisplayUserTexts(text: "${users["lastname"]}"),
                ),
                const SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 250,
                  child: ChatAllDisplayUserTexts(text: "${users["email"]}"),
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
          onTap: () {},
        );
      }
    }
    /* else if search bar is empty Check if the documents that we accessed has an eamil that is not simillar to the current users email
    because we will not display the current user here only those other users*/
    else if (FirebaseAuth.instance.currentUser!.email != users['Email Address']) {
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
                backgroundImage: CachedNetworkImageProvider("${users["profilePhoto"]}"),
                radius: 30,
              ),
              const SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 100,
                child: ChatAllDisplayUserTexts(text: "${users["firstname"]}"),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 130,
                child: ChatAllDisplayUserTexts(text: "${users["lastname"]}"),
              ),
              const SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 250,
                child: ChatAllDisplayUserTexts(text: "${users["email"]}"),
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
                return ConsumerActualChat(
                  consumerId: consumerID,
                  consumerName: consumerName,
                  consumerLname: consumerLname,
                  consumerUname: consumerUname,
                  profilePhoto: profilePhoto,
                  isOnline: isOnline,
                  consumerEmail: consumerEmail,
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
