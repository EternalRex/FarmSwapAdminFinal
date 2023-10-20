import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/admin_logs_model.dart';

class AdminLogsSaving {
  final _db = FirebaseFirestore.instance;

  createAdminLogs(AdminLogsModel adminLogsModel) async {
    await _db.collection('AdminLogs').add(adminLogsModel.toJson());
  }
}
