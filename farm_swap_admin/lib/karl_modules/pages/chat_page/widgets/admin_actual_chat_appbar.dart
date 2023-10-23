import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_swap_admin/constants/Colors/colors.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/admin_actual_chat_backbtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar actualChatAppBarWidget(
    String profileUrl, String username, String userLastname, bool isOnline, String email) {
  return AppBar(
    elevation: 15,
    foregroundColor: Colors.black,
    backgroundColor: farmSwapTitlegreen,
    automaticallyImplyLeading: false,
    toolbarHeight: 80,
    /*This row contains all the contents of the appbar*/
    title: Row(
      children: [
        /*This part is about the profile image and an indicator that changes its color depending
        if the user is online or offline */
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(profileUrl),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 50),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: (isOnline == true) ? Colors.green : Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        /*This column contains the User name and its email under that name */
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$username " " $userLastname",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
            child: SizedBox(
          width: 10,
        )),
        const Expanded(
          flex: 1,
          child: Column(
            children: [
              AdminActualChatBackBtn(),
            ],
          ),
        )
      ],
    ),
  );
}
