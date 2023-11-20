import 'package:flutter/material.dart';

class SpecificWalletDetailsProvider with ChangeNotifier {
  /*I need a string property that will carry the value of the 
  userid whenever i click the uer id button */
  String userid = "";

/*a getter of the setter method below to actuall call a setter in anothe class
i need to use thi getter + equal sign =>>>>>>> userid = */
  String getUserId() {
    return userid;
  }

  /*A setter to be called to set the value of the userid id variable
  whenever or wherever this setter method is called */
  void setUserId(String id) {
    /*i will now put a value to the userid variable
    the value can be accessible in any class*/
    userid = id;
    notifyListeners();
  }
}
