import 'package:farm_swap_admin/rollaine_modules/pages/user_page/widgets/Text/right_user_text.dart';
import 'package:flutter/material.dart';

class UserArchiveOptionsBtn extends StatelessWidget {
  const UserArchiveOptionsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const RightUserText(
                myText: 'Archive',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage('assets/rollaine_assets/icons/delete.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}
