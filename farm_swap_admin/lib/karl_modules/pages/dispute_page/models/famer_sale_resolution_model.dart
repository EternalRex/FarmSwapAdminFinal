class FarmerSaleResoluitonModel {
  FarmerSaleResoluitonModel({
    required this.listUrl,
    required this.adminemail,
    required this.resolutionMessage,
    required this.penaltyMessage,
    required this.resolutionDate,
    required this.farmerid,
    required this.consumerid,
    required this.reportedUname,
    required this.reportingUname,
    required this.reportedRole,
    required this.reportingRole,
  });

  final String listUrl;
  final String adminemail;
  final String resolutionMessage;
  final String penaltyMessage;
  final DateTime resolutionDate;
  final String farmerid;
  final String consumerid;
  final String reportedUname;
  final String reportingUname;
  final String reportedRole;
  final String reportingRole;

  Map<String, dynamic> toMap() {
    return {
      'listUrl': listUrl,
      'adminemail': adminemail,
      'resolutionMessage': resolutionMessage,
      'penaltyMessage': penaltyMessage,
      'resolutionDate': resolutionDate,
      'farmerid': farmerid,
      'consumerid': consumerid,
      'reportedUser': reportedUname,
      'reportingUser': reportingUname,
      'reportingRole': reportedRole,
      'reportedRole': reportedRole,
    };
  }
}
