import 'package:flutter/material.dart';

class CustomerUserIdProvider with ChangeNotifier {
  String customerUserId = '';

  String getCustomerUserId() {
    return customerUserId;
  }

  void setcustomerUserId(String userId) {
    customerUserId = userId;
    notifyListeners();
  }
}
