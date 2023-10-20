import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/admin_chat_screen.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/consumer_chat_screen.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/farmer_chat_screen.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/widgets/chat_side_text_widget.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard_epxanded1_items.dart';
import 'package:flutter/material.dart';

import '../../../../constants/Colors/colors_rollaine.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String selectedChatScreen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /*First expanded for side navigation */
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
                child: const DashBoardExpanded1Item(),
              ),
            ),
          ),
          /*Secondd expanded to contain the available online users for chat*/
          Expanded(
            flex: 4,
            child: Container(
              child: Scaffold(
                /*This is a condition that means if the user clicks the admin sidebar option
                it will show the admin screen, same goes to the farmer and consumer screen */
                body: (selectedChatScreen != "FARMER" && selectedChatScreen != "CONSUMER")
                    ? const AdminChatScreen()
                    : (selectedChatScreen != "ADMIN" && selectedChatScreen != "CONSUMER")
                        ? const FarmerChatScreen()
                        : const ConsumerChatScreen(),
              ),
            ),
          ),
          /*Expanded that will contain the option of what kind of user you wish
          to chat, either admin, farmer or consumer */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    /*Aligns the contents inside the container to align vertically */
                    alignment: Alignment.center,
                    child: Column(
                      /*Ensures that the column remains on its minimum size and not grow
                      proportionally with the container */
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /*Admin Chat Option */
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedChatScreen = "ADMIN";
                            });
                          },
                          child: const ChatSideBarOptions(
                              text: "Admin", image: "assets/rollaine_assets/icons/admin.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*Farmer Chat Options */
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedChatScreen = "FARMER";
                            });
                          },
                          child: const ChatSideBarOptions(
                              text: "Farmers", image: "assets/rollaine_assets/icons/user.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*Consumer chat options */
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedChatScreen = "CONSUMER";
                            });
                          },
                          child: const ChatSideBarOptions(
                              text: "Consumers", image: "assets/rollaine_assets/icons/user.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
