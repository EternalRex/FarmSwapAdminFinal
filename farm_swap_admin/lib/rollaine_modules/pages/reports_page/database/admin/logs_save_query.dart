import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/model/admin_logs_model.dart';

class AdminLogsSaving {

  //Initializes a Firestore database.
  final db = FirebaseFirestore.instance;

  //Represents the admin log data that you want to save.
  //Specifies the Firestore collection where the admin logs will be stored.
  //Adds a new document to the 'AdminLogs' collection
  createAdminLogs(AdminLogsModel adminLogsModel) async {
    await db.collection('AdminLogs').add(adminLogsModel.toJson());
  }
}
