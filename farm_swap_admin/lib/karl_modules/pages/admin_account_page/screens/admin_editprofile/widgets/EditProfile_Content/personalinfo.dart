import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account_wrapper/read_admin_users.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard_query/dashboard_query.dart';
import 'package:flutter/material.dart';
import 'personalInfo_Class.dart';

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
  PersonalInfo({
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              height: 550,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 5,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //calling the class to display the edit profile information
                                EditPersonalInfo(documentId: data),
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
