import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/admin_notification_model.dart';

class AdminNotificationQuerry {
  final String notifiAddId = "myNotification";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*Saving to the database*/
  Future<void> sendNotification(String senderId, String receiverId, String notifContent,
      String? senderName, String receiverName, notifDate, notifType) async {
    //creating a new notif
    AdminNotificationModel adminNotif = AdminNotificationModel(
      notifSenderId: senderId,
      notifSenderName: senderName,
      notifReceiverId: receiverId,
      notifReceiverName: receiverName,
      notifMessage: notifContent,
      notifDate: notifDate,
      notifCategory: notifType,
    );

    /*Diri na part is ang id sa collection is ang id sa receiver, since siya may makadawat sa notif therefore
    adto ma save sa iyahang collection ni receiver */

    //constructing the id of the collection
    List<String> notifId = [receiverId, notifiAddId];
    notifId.sort();
    //joining the two id's together to create one id separated by _
    String finalNotifId = notifId.join("_");

    //adding the new notification to the AdminNotificationCollection
    _firestore.collection("AdminNotification").doc(finalNotifId).collection("notifications").add(
          adminNotif.toMap(),
        );
  }

  Stream<QuerySnapshot> getAdminNotifications(String userid) {
    /*Sa diri na part is ang userid atong gamit since mag pull out man ta sa mga notifications nga
    nadawat therefore, ang uid ni user atong gamiton, so same gihapon siya pagka construct ang id
    sa method sa ibabaw, kay ang kanang sendnotif gamiton na sa sender side, unya kaning getnotif 
    gamiton ni sa receiver side */

    //reconstructing the id to make sure it is simillar to the previously saved
    List<String> notifId = [userid, notifiAddId];
    notifId.sort();
    String finalNotifId = notifId.join("_");

    //pullouting the data using the reconstructed id because it is  surely the same to the saved one
    return _firestore
        .collection("AdminNotification")
        .doc(finalNotifId)
        .collection("notifications")
        .orderBy('notifDate', descending: true)
        .snapshots();
  }
}
