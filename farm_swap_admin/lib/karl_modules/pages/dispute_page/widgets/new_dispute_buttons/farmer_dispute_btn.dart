import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/farmer_dispute/farmer_dispute_display.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_text/dispute_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FarmerDisputeBtn extends StatelessWidget {
  const FarmerDisputeBtn({super.key});

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FarmerDisputeDisplay();
                    },
                  ),
                );
              },
              child: const Row(
                children: [
                  DisputeText(myText: "Farmer Dispute", myColor: Colors.black),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    FontAwesomeIcons.gavel,
                    size: 13,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
