import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/database/admin_consumer_chat_query.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/functions/chat_message_inputbox.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_actual_chat_appbar.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_actual_chat_bubble.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsumerActualChat extends StatefulWidget {
  const ConsumerActualChat({
    super.key,
    required this.consumerId,
    required this.consumerName,
    required this.consumerLname,
    required this.consumerUname,
    required this.profilePhoto,
    required this.isOnline,
    required this.consumerEmail,
  });

  final String consumerId;
  final String consumerName;
  final String consumerLname;
  final String consumerUname;
  final String profilePhoto;
  final bool isOnline;
  final String consumerEmail;

  @override
  State<ConsumerActualChat> createState() => _ConsumerActualChatState();
}

class _ConsumerActualChatState extends State<ConsumerActualChat> {
  /*A text controller for our chat input */
  TextEditingController chatController = TextEditingController();

  /*instance of firebase auth and firestore */
  final _firebaseAuth = FirebaseAuth.instance;

  /*Object of the Chat querry class*/
  AdminConsumerChatQuery chat = AdminConsumerChatQuery();

  /*A function that will call the sendmessage method from our querry class*/
  void _sendMessage() async {
    String message = chatController.text;
    /*pass the needed values to send message into the querry class, to construct
    the chatroom id and save message into firestore*/
    await chat.sendMessage(
      widget.consumerId,
      FirebaseAuth.instance.currentUser!.uid,
      FirebaseAuth.instance.currentUser!.uid,
      message,
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
                    widget.profilePhoto,
                    widget.consumerName,
                    widget.consumerLname,
                    widget.isOnline,
                    widget.consumerEmail,
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

  /*Actual qurry is in the querry class*/
  _buildUserMessageList() {
    return StreamBuilder(
      stream: chat.getChatMessages(widget.consumerId, FirebaseAuth.instance.currentUser!.uid),
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
    Timestamp timeSTMP = data["messageTime"];
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
              ? AdminChatSenderBubble(content: data["messageContent"])
              : AdminChatReceiverBubble(content: data["messageContent"])
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
              /*
              Provider.of<AdminNotificationProvider>(context, listen: false)
                  .setIncrement(widget.receiverId);*/
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
