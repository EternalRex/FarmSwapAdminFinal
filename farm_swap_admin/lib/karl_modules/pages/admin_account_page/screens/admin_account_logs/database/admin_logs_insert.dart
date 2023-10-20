import '../model/admin_logs_model.dart';
import 'admin_logs_save.dart';

class AdminLogsInsertDataDb {
  AdminLogsSaving saving = AdminLogsSaving();

  Future<void> createAdminLogs(
      String? email, String? id, String activity, DateTime date) async {
    final adminLogs = AdminLogsModel(
      adminUserEmail: email,
      adminUserId: id,
      adminActivity: activity,
      adminActivityDate: date,
    );
    saving.createAdminLogs(adminLogs);
  }
}
