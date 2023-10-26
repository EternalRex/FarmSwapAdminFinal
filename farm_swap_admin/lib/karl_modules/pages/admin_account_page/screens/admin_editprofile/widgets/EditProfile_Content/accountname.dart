import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:flutter/material.dart';

import '../../../../../dashboard_page/dashboard_query/dashboard_query.dart';
import '../../../admin_account_wrapper/read_admin_users.dart';
import '../account_name/account_name_profileInfo.dart';

// ignore: must_be_immutable
class AccountName extends StatelessWidget {
  AccountName({
    super.key,
  });

  final GetAllAdminAccs getAllAdminAccs = GetAllAdminAccs();
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 2,
                    offset: const Offset(1, 5),
                  ),
                ],
              ),
              height: 90,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          //CURRENT ADMIN USER PROFILE PICTURE
                          /*In this future builder we will get the document id that we get from
                        the database querry in the dashboardquery file */
                          FutureBuilder(
                            /*The id was the object we creted above to access the methods inside the dashboard
                      query file. we call the get docsId() method, meaning  we tell it to execute and
                      get the document id of the current user */
                            future: id.getDocsId(),

                            /*so this builder means that it will build the context meaning this page
                      and this class. It will also build the snapshot, which is the object
                      that we use to acces the data fom getDocsID() method */
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                /*Since the getDocsId is a Future<sting> it will return a the 
                          documentId but in a futue form so not the actual string so we 
                          need this snaphot to actually get the string and not the future form*/
                                String data = snapshot.data!;
                                return Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /*We call the profilephoto class from ourr dashboard profileinfo and then
                                pass the variable data that has the documentid string form*/
                                      ProfilePhotoAccount(documentId: data),
                                    ],
                                  ),
                                );
                              } else {
                                /*If the data is not yet given so it will display no data until data is presented */
                                return const Text("No data");
                              }
                            },
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          //this column holds the first name, last name and role of the
                          //current admin user
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 3,
                              ),
                              //CURRENT ADMIN USER NAME
                              /*THE NAME OF THE USER, This future builder will display the name of the current uer
                              its ways ae simillar above */
                              FutureBuilder(
                                future: id.getDocsId(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String data = snapshot.data!;
                                    return Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ProfileAccountName(documentId: data),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const Text("No data");
                                  }
                                },
                              ),

                              //CURRENT ADMIN USER ID
                              /*THE ID OF THE USER, This future builder will display the role of the current uer
                              its ways ae simillar above */
                              FutureBuilder(
                                future: id.getDocsId(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String data = snapshot.data!;
                                    return Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ProfileId(documentId: data),
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
                          const SizedBox(
                            width: 300,
                          ),
                        ],
                      ),
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
