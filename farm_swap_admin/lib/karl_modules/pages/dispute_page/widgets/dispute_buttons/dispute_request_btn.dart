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
                myText: 'Resolved Disputes',
                myColor: Color(0xFF09041B),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.check_box,
              color: Colors.red,
              size: 13,
            ),
          ],
        ),
      ),
    );
  }
}
