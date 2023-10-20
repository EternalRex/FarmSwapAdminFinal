import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/chat_message_model.dart';

class Chat2Qeurry extends ChangeNotifier {
  //creating the instance of firebase firestore and firebase auth
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

//Method to send a message
  Future<void> sendMessage(String receiverId, String messages) async {
    //get the current user info
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    //we need to get the time when the message was sent to arranged it accordingly when displaying
    final Timestamp time = Timestamp.now();

    //creating a new message
    ChatMessageModel message = ChatMessageModel(
      senderEmail: currentUserEmail,
      senderId: currentUserId,
      receiverId: receiverId,
      content: messages,
      timestamp: time,
    );

    //Construct the chat room for the sender and receiver by giving that chatroom an id
    List<String> chatroomid = [currentUserId, receiverId];
    //sort the idea to make sure that chat room id will always be the same for any pair of users
    chatroomid.sort();
    //combine the id's as a singleid to become the chatroom id
    String finalChatRoomId = chatroomid.join("_");

    //add the new message to the database
    await _firestore
        .collection('ChatRooms')
        .doc(finalChatRoomId)
        .collection('chats')
        .add(message.toMap());
  }

//Gettig the message
  Stream<QuerySnapshot> getChatMessages(String userid, String otherUserid) {
    //Construct the chat room for the sender and receiver by giving that chatroom an id
    List<String> chatRoomId = [userid, otherUserid];
    chatRoomId.sort();
    String finalChatRoomId = chatRoomId.join("_");

    //pulls out the messages in the specific chat room
    return _firestore
        .collection('ChatRooms')
        .doc(finalChatRoomId)
        .collection("chats")
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}
