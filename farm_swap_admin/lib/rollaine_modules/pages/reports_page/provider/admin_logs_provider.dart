import 'package:flutter/material.dart';

//it's a provider class capable of notifying its listeners when its internal data changes.
class AdminLogsProvider with ChangeNotifier {

  //This variable is used to store the admin user's ID.
  String adminuserid = "";

  //Returns the current adminuserid value.
  String getadminUserId() {
    return adminuserid;
  }

  //Update the adminuserid with a new value, provided as the id parameter.
  void setadminUserId(String id) {
    adminuserid = id;

    //It notifies any widgets that are listening to this provider to rebuild and reflect the changes in the state.
    notifyListeners();
  }
}