import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_editprofile/widgets/Text/editprofile_text.dart';
import 'package:flutter/material.dart';

class ArchiveOptionsBtn extends StatelessWidget {
  const ArchiveOptionsBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.of(context)
                //   .pushNamed(RoutesManager.deactivateaccountpage);
              },
              child: const EditProfileText(
                myText: 'Archive Account',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage('assets/karl_assets/images/archive.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}
