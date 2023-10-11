import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/admin_account_wrapper.dart';

class GetCurrentAdminID {
  //Create a varible that will hold the id that we get
  String? documentId;

  //Object of the GetUsername class
  ReadAdminAccount getuserid = ReadAdminAccount();

  //create an object of the firestore
  FirebaseFirestore database = FirebaseFirestore.instance;

  //Future method that will return a String]
  Future<String?> getAdminDetailsId(String data) async {
    String currentUserId = data;
    await database
        .collection("AdminUsers")
        .where("User Id", isEqualTo: currentUserId)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              documentId = element.reference.id;
            },
          ),
        );
    return documentId;
  }
}
