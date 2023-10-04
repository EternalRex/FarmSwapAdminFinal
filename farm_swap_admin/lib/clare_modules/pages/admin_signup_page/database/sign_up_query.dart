import '../models/sign_up_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAdminUser {
  FirebaseFirestore addminDB = FirebaseFirestore.instance;

  //method to query firestore
  createUser(AdminUserModel user) async {
    await addminDB.collection('AdminUsers').add(user.toJson());
  }
}
