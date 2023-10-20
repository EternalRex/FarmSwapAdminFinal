import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_archived_account/widgets/personalinfo_Archived.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile/editprofile_description.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile_Btns/archive_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile_Btns/deactivate_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile_Btns/update_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile_Content/accountname.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/EditProfile_Content/formtitle.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_admin_account_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_communications_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_dashboard_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_dispute_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_listings_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_logout_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_options_header_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_reports_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_transactions_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_user_account_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_buttons_widgets/dashboard_wallet_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/accountname.dart';
import '../widgets/archived_account_documentID.dart';

class AdminArchivedAccount extends StatefulWidget {
  const AdminArchivedAccount({
    super.key,
  });

  @override
  State<AdminArchivedAccount> createState() => _AdminArchivedAccountState();
}

class _AdminArchivedAccountState extends State<AdminArchivedAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
      body: Row(
        children: [
          /*FIRST EXPANDED NO VALUE PARA LANG JUD MATUNGA SI 2ND EXPANDED */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                /*DECORATING THE CONTAINER */
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),

          /*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
          Expanded(
            flex: 4,
            // ignore: avoid_unnecessary_containers
            child: Container(
              /*SETTING THE BACKGROUND OF THE CENTER OF THE PAGE INTO WHITE */
              child: Padding(
                /*WRAPPING A SCAFFOLD WITH PADDING SO THAT IT WILL HAVE SOME SPACE
                FROM THE BORDERS OF THE OTHER 2 DIVISIONS */
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                /*PUTTING A SCAFFOLD INSIDE THE  CENTER CONTAINER SO THAT WE CAN
                USE THE BODY PROPERTY AND DECLARE SOME COLUMN OR ROWS THAT WILL HAVE
                A CHILDREN PROPERTY WHERE WE CAN PUT A LOT OF WIDGETS HEHEHE */
                child: Scaffold(
                  /*THIS IS AN APPBAR OF THE CENTER DIVISION THAT HAS THE DASHBOARD TITLE AND THE 
                  SEARCH BAR */

                  appBar: AppBar(
                    /*PUTTING AND STYLING THE DASHBOARD TITLE. I USED THE TEXT CLASS THAT I CREATED IN
                  THIS TITLE, THAT CLASS CAN BE FOUND IN WIDGET_DASHBOARD_TXT.DART*/
                    title: const DashBoardTitleText(
                      myText: "Account Archived",
                      myColor: Colors.red,
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                  ),

                  /*START OF THE SECOND EXPANDEDS BODY */
                  body: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          //Decorate the expanded area for the main content
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 15),
                          child: Container(
                            //Design of the container
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),

                              //Box shadow of container
                              boxShadow: [
                                BoxShadow(
                                  color: shadow,
                                  blurRadius: 2,
                                  offset: const Offset(1, 5),
                                ),
                              ],
                            ),

                            //Column for main content
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  //Title
                                  const FormTitle(),

                                  /*THIS calls the class that will display the current user admin profile picture, 
                                  full name and user ID
                                   */
                                  AccountNameArchived(),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 14,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                            height: 720,
                                            child: Column(
                                              children: [
                                                //calling the class that displays the title header
                                                const EditProfileDescription(),

                                                //calling the class that displays the account status and the user details
                                                ArchivedStatus(),

                                                //calling the class that displays user details
                                                PersonalInfoArchived(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /*THIRD EXPANDED NO VALUE PARA LANG JUD MATUNGA SI 2ND EXPANDED */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
