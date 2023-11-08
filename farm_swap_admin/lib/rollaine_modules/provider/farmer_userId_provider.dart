import 'package:flutter/material.dart';

//It's a provider class that can notify its listeners when its data changes.
class FarmerUserIdProvider with ChangeNotifier {

  //This variable is used to store the farmer user's ID.
  String farmerUserId = '';

  //Returns the current farmerUserId value.
  String getFarmerUserId() {
    return farmerUserId;
  }

  //Update the farmerUserId with a new value, provided as the userId parameter.
  void setfarmerUserId(String userId) {
    farmerUserId = userId;

    //It tells any widgets that are listening to this provider to rebuild and reflect the changes in the state.
    notifyListeners();
  }
}