import 'package:flutter/material.dart';

class ListingsNotificationOptionsBtn extends StatelessWidget {
  const ListingsNotificationOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        onPressed: () {},
        icon:
            Image.asset('assets/rollaine_assets/icons/notification.png'),
        iconSize: 24,
      ),
    );
  }
}