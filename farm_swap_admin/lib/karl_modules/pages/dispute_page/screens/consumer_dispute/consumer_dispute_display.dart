import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/consumer_dispute/get_consumer_dispute.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/consumer_dispute/get_consumer_sale_dispute.dart';
import 'package:flutter/material.dart';

class ConsumerDisputeDisplay extends StatefulWidget {
  const ConsumerDisputeDisplay({super.key});

  @override
  State<ConsumerDisputeDisplay> createState() => _ConsumerDisputeDisplayState();
}

class _ConsumerDisputeDisplayState extends State<ConsumerDisputeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*This is the row for the consumer barter dispute */
        Row(
          children: [
            Column(
              children: [
                /*Just the title that says Barter Disputes */
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 378,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadow,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                        child: poppinsText("Barter Disputes", Colors.black, 15, FontWeight.bold)),
                  ),
                ),
                /*The container that carries the data */
                SingleChildScrollView(
                  child: Container(
                    width: 395,
                    height: 600,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const GetConsumerBarterDispute(),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          thickness: 3,
        ),
        /*This is the row for the consumer sell dispute */
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    height: 50,
                    width: 378,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadow,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                        child: poppinsText("Sale Disputes", Colors.black, 15, FontWeight.bold)),
                  ),
                ),
                Container(
                  width: 395,
                  height: 600,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const GetConsumerSaleDispute(),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
