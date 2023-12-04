import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/farmer_chat/farmer_chat_screen.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';

class AdminActualChatBackBtn extends StatelessWidget {
  const AdminActualChatBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RoutesManager.chatpage);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: 20,
    );
  }
}

class AdminFarmerChatBackBtn extends StatelessWidget {
  const AdminFarmerChatBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const FarmerChatScreen();
          },
        ));
      },
      icon: const Icon(Icons.arrow_back_ios_new),
      iconSize: 20,
    );
  }
}
