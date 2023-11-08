//Defines the properties that the AdminLogsModel should have. 
class AdminLogsModel {
  AdminLogsModel(
      {required this.adminUserEmail,
      required this.adminUserId,
      required this.adminActivity,
      required this.adminActivityDate});

  //These member variables represent the properties of the AdminLogsModel class.
  String? adminUserEmail;
  String? adminUserId;
  String adminActivity;
  DateTime adminActivityDate;

  //This method is used to convert an instance of the AdminLogsModel class to a JSON representation.
  toJson() {
    return {
      "Admin Email": adminUserEmail,
      "Admin Id": adminUserId,
      "Admin Activity": adminActivity,
      "Activity Date": adminActivityDate,
    };
  }
}