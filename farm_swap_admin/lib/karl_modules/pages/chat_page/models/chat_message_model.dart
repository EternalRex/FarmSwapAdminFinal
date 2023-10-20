import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  ChatMessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  //Properties
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String content;
  final Timestamp timestamp;

  /*converting this model properties into json format 
  matching the properties in our database to the properties of this model*/
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'content': content,
      'timeStamp': timestamp,
    };
  }
}
