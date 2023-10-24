import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_notification_page/database/admin_notif_querry.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/database/chat_querry.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/functions/chat_message_inputbox.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_actual_chat_appbar.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_actual_chat_bubble.dart';
import 'package:farm_swap_admin/provider/admin_notifiIncrementer_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../constants/Colors/colors_rollaine.dart';
import '../../dashboard_page/screens/dashboard_epxanded1_items.dart';

class AdminActualChat extends StatefulWidget {
  const AdminActualChat({
    super.key,
    required this.receiverId,
    required this.receiverImage,
    required this.receiverFname,
    required this.receiverLname,
    required this.isOnline,
    required this.receiverEmail,
  });

  final String receiverImage;
  final String receiverFname;
  final String receiverLname;
  final String receiverId;
  final bool isOnline;
  final String receiverEmail;

  @override
  State<AdminActualChat> createState() => _AdminActualChatState();
}

class _AdminActualChatState extends State<AdminActualChat> {
  /*A text controller for our chat input */
  TextEditingController chatController = TextEditingController();

  /*instance of firebase auth and firestore */
  final _firebaseAuth = FirebaseAuth.instance;

  /*Object of the Chat querry class*/
  Chat2Qeurry chat = Chat2Qeurry();

  /*Instance of the notification class to notify other users that a chat has been sent*/
  final AdminNotificationQuerry _adminNotifDB = AdminNotificationQuerry();

  /*A function that will call the sendmessage method from our querry class*/
  void _sendMessage() async {
    String message = chatController.text;
    /*pass the needed values to send message into the querry class, to construct
    the chatroom id and save message into firestore*/
    await chat.sendMessage(widget.receiverId, chatController.text);

    /*After sending the message we will also send a notification to the receiver*/
    await _adminNotifDB.sendNotification(
      _firebaseAuth.currentUser!.uid,
      widget.receiverId,
      "You receive a message: ${" "}  ${"'$message'"} ",
      _firebaseAuth.currentUser!.email,
      widget.receiverEmail,
      DateTime.now(),
      "CHAT",
    );

    chatController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
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
                  appBar: actualChatAppBarWidget(
                    widget.receiverImage,
                    widget.receiverFname,
                    widget.receiverLname,
                    widget.isOnline,
                    widget.receiverEmail,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Expanded(
                          child: _buildUserMessageList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: _buildMessageInput(),
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

/*This method will acess the documents all the documents in the ChatRooms collection the 
actual qurry is in the querry class*/
  _buildUserMessageList() {
    return StreamBuilder(
      stream: chat.getChatMessages(_firebaseAuth.currentUser!.uid, widget.receiverId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((document) => accessDocumentContents(document))
                .toList(),
          );
        } else {
          return const Text("Loading...");
        }
      },
    );
  }

  /*This methods access the properties and its value of each document that is baing passed here*/
  Widget accessDocumentContents(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var messageAlignment = (data["senderId"] != _firebaseAuth.currentUser!.uid)
        ? Alignment.topLeft
        : Alignment.topRight;

    /*Converting the date into string*/
    Timestamp timeSTMP = data["timeStamp"];
    DateTime dateTime = timeSTMP.toDate();
    String finalDate = DateFormat('dd-MM-yyyy').format(dateTime);

    return Container(
      alignment: messageAlignment,
      child: Column(
        crossAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(
            finalDate,
            style: const TextStyle(fontSize: 8, color: Colors.grey),
          ),
          (data["senderId"] == _firebaseAuth.currentUser!.uid)
              ? AdminChatSenderBubble(content: data["content"])
              : AdminChatReceiverBubble(content: data["content"])
        ],
      ),
    );
  }

  /*This method builds the message input*/
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: ChatInputTxtField(controller: chatController, hintText: "Enter message....")),
        const SizedBox(
          width: 7,
        ),
        CircleAvatar(
          backgroundColor: farmSwapTitlegreen,
          child: IconButton(
            onPressed: () {
              _sendMessage();
              Provider.of<AdminNotificationProvider>(context, listen: false)
                  .setIncrement(widget.receiverId);
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
