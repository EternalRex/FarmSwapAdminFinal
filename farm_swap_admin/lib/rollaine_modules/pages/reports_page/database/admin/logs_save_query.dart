import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/model/admin_logs_model.dart';

class AdminLogsSaving {
  final db = FirebaseFirestore.instance;

  createAdminLogs(AdminLogsModel adminLogsModel) async {
    await db.collection('AdminLogs').add(adminLogsModel.toJson());
  }
}
