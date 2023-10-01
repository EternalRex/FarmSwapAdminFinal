import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_text/dispute_text.dart';
import 'package:flutter/material.dart';

class DisputeRequestOptionsBtn extends StatelessWidget {
  const DisputeRequestOptionsBtn({
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
              onPressed: () {},
              child: const DisputeText(
                myText: 'Dispute Requests',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Image(
              image: AssetImage(
                  'assets/karl_assets/images/deactivate.png'),
              height: 23,
              width: 23,
            ),
          ],
        ),
      ),
    );
  }
}
