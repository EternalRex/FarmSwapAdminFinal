import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/query/get_admin_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../admin_logs_wrapper.dart';
import '../provider/adminlogs_provider.dart';

// ignore: must_be_immutable
class AdminLogsID extends StatelessWidget {
  AdminLogsID({super.key});

  String _userID = "";

//create a object to access into getcurrentadminID class
  GetCurrentAdminID getCurrentAdminID = GetCurrentAdminID();

  @override
  Widget build(BuildContext context) {
    _userID = Provider.of<AdminActivityProvider>(context).getadminUserId();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getCurrentAdminID.getAdminDetailsId(_userID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String data = snapshot.data!;
              //if the data has id
              //the documentID which is naa nay data
              //pass into admin specific activity wrapper
              return AdminLogsSpecificWrapper(documentID: data);
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
