import 'package:flutter/material.dart';

class FarmerUserIdProvider with ChangeNotifier {
  String farmerUserId = '';

  String getFarmerUserId() {
    return farmerUserId;
  }

  void setfarmerUserId(String userId) {
    farmerUserId = userId;
    notifyListeners();
  }
}