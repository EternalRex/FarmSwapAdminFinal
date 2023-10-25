import 'package:flutter/material.dart';

class AdminLogsProvider with ChangeNotifier {

  String adminuserid = "";

  String getadminUserId() {
    return adminuserid;
  }

  void setadminUserId(String id) {

    adminuserid = id;
    notifyListeners();
  }
}