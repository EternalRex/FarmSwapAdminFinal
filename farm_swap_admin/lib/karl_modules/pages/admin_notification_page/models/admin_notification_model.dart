class AdminNotificationModel {
  AdminNotificationModel({
    required this.notifSenderId,
    required this.notifSenderName,
    required this.notifReceiverId,
    required this.notifReceiverName,
    required this.notifMessage,
    required this.notifDate,
    required this.notifCategory,
  });

/*Notification model properties */
  String notifSenderId;
  String? notifSenderName;
  String notifReceiverId;
  String notifReceiverName;
  String notifMessage;
  String notifCategory;
  DateTime notifDate;

/*Notification Model json mapping */
  Map<String, dynamic> toMap() {
    return {
      'notifSenderId': notifSenderId,
      'notifSenderName': notifSenderName,
      'notifReceiverName': notifReceiverName,
      'notifMessage': notifMessage,
      'notifDate': notifDate,
      'notifCateogry': notifCategory
    };
  }
}
