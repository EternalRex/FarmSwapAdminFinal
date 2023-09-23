import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/widgets/editprofile_description.dart';
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
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_search.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/widgets/dshb_textfield_widgets/widget_dashboard_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminEditProfile extends StatefulWidget {
  const AdminEditProfile({super.key});

  @override
  State<AdminEditProfile> createState() => _AdminEditProfileState();
}

class _AdminEditProfileState extends State<AdminEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
      body: Row(
        children: [
/*FIRST EXPANDED THAT WILL CONTAIN ALL THE NAVIGATION */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                /*DECORATING THE CONTAINER */
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*A COLUMN THAT WILL HOLD THE NAVIGATIONS OPTIONS */
                child: const Column(
                  children: [
                    /*THE TITLE AND LOGO IN THE PAGE OPTIONS */
                    DashPageOptionsTitle(),
                    /*30 PXLS SPACE BETWEEN*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL HOLD THE DASHBOARD LOGO AND THE DASHBOARD LABEL */
                    DashBoardOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    DashAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    DashUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    DashListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    DashTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    DashReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    DashDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    DashWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE COMMUNICATIONS ICON AND LABEL */
                    DashCommunicationOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    Spacer(),
                    /*THIS ROW WILL CONTAIN THE lOGOUT ICON AND LABEL */
                    DashLogoutOptionBtn(),
                  ],
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
                      myText: "Edit Profile",
                      myColor: Color(0xFF09041B),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    /*IN THE  APPBAR, WE USED THE ACTIONS PROPERTY SO THAT WE CAN PUT
                    A LOT OF WIDGETS IN THE APPBAR, IN HERE IT IS USED SO THAT WE CAN PUT 
                    A TEXT FIELD WIDGET FOR SEARCHING*/
                    actions: const [
                      /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
                      Padding(
                        padding: EdgeInsets.all(10),
                        /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                        HEIGH AND WIDTH OF THE TEXT FIELD */
                        child: SizedBox(
                          width: 250,
                          height: 15,
                          /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                          IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
                          child: DashBSearchBar(),
                        ),
                      ),
                    ],
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
                                  //Name
                                  const EditProfileDescription(),

                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 14),
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
                                            height: 60,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      //Farmer profile
                                                      const Image(
                                                        image: AssetImage(
                                                            'assets/rollaine_assets/images/vaugh.png'),
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),

                                                      //Farmer name and identity
                                                      Column(
                                                        children: [
                                                          Text(
                                                            'Vaugh Noe Cabusao',
                                                            style: Poppins.userName
                                                                .copyWith(
                                                              color: const Color(
                                                                  0xFF09041B),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 110),
                                                            child: Text(
                                                              'Farmer',
                                                              style: Poppins
                                                                  .detailsText
                                                                  .copyWith(
                                                                color: const Color(
                                                                    0xFF09041B),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 470),
                                                      IconButton(
                                                        onPressed: () {},
                                                        icon: const Icon(
                                                            Icons.edit_square),
                                                        color: greenNormal,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 14),
                                          child: Container(
                                            height: 100,
                                            color: Colors.amber,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: NetworkImage(
                                                        "https://images.pexels.com/photos/1468379/pexels-photo-1468379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Erza Scarlet Heartfilia',
                                                        style: Poppins
                                                            .contentText
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF09051C),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Admin',
                                                        style: Poppins
                                                            .rightTitle
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF09051C),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
          /*THIRD EXPANDED THAT WILL HOLD THE EDIT PROFILE */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*COLUMN THAT WILL CONTAIN EVERY ITEM OF THIS EXPANDED */
                child: Column(
                  children: [
                    /*FIRST ROW OF THE COLUMN THAT WILL HOLD THE PROFILE LABEL, THE MESSAGE 
                    AND THE NOTIFICATION ICON*/
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      child: Row(
                        children: [
                          /*PROFILE TEXT */
                          const SizedBox(
                            width: 54,
                          ),
                          /*MESSAGE BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.envelope,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                          /*NOTIFICATIOIN BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    /*SECOND ROW THAT WILL CONTAIN THE PROFILE PICTURE AND ID */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*PROFILE PICTURE WITH AN IMAGE PICKER SO WE CAN PICK IMAGE */
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://images.pexels.com/photos/1468379/pexels-photo-1468379.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                            ),
                            /*POSITIONING THE ADD PHOTO ICON INSIDE THE STACK */
                            Positioned(
                              width: 100,
                              bottom: -10,
                              left: 30,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_a_photo),
                                color: farmSwapSmoothGreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
