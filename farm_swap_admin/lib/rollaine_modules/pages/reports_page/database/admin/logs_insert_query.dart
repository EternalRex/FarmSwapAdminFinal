import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_save.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_logs/model/admin_logs_model.dart';

class AdminLogsInsertDataDb {
  AdminLogsSaving saving = AdminLogsSaving();

  Future<void> createAdminLogs(
      String? email, String? id, String activity, DateTime date) async {
    final adminLogs = AdminLogsModel(
        adminUserEmail: email,
        adminUserId: id,
        adminActivity: activity,
        adminActivityDate: date);
    saving.createAdminLogs(adminLogs);
  }
}
