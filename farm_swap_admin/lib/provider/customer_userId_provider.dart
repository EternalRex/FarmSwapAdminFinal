import 'package:flutter/material.dart';

class CustomerUserIdProvider extends ChangeNotifier {
  String customerUserId = '';

  String getCustomerUserId() {
      print("providerid=" + customerUserId);
    return customerUserId;
  }

  void setcustomerUserId(String userId) {
    customerUserId = userId;
    print("setId=" + customerUserId);
    notifyListeners();
  }
}
