import 'package:flutter/material.dart';

class ListingsChatOptionsBtn extends StatelessWidget {
  const ListingsChatOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/rollaine_assets/icons/chat.png'),
        iconSize: 23,
      ),
    );
  }
}