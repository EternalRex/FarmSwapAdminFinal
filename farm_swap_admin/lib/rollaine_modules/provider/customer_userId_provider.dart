import 'package:flutter/material.dart';

//It's a provider class that can notify its listeners when its data changes.
class CustomerUserIdProvider extends ChangeNotifier {

  //This variable is used to store the farmer user's ID.
  String customerUserId = '';

  //Returns the current customerUserId value.
  String getCustomerUserId() {
    return customerUserId;
  }

  //Update the customerUserId with a new value, provided as the userId parameter.
  void setcustomerUserId(String userId) {
    customerUserId = userId;

    //It tells any widgets that are listening to this provider to rebuild and reflect the changes in the state.
    notifyListeners();
  }
}
