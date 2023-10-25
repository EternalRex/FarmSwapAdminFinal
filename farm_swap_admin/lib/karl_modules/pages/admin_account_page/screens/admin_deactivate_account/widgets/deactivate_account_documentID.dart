import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_deactivate_account/widgets/deactivate_account_class.dart';
import 'package:flutter/material.dart';
import '../../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../admin_account_wrapper/read_admin_users.dart';

// ignore: must_be_immutable
class DeactivatedStatus extends StatelessWidget {
  DeactivatedStatus({
    super.key,
  });

  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
              vertical: 2,
            ),
            child: Container(
              height: 85,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //calling the class to display the edit profile information
                                DeactivateAccountDisplay(documentId: data),
                              ],
                            ),
                          );
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
