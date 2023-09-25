import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class AccountName extends StatelessWidget {
  const AccountName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50, vertical: 14),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    blurRadius: 2,
                    offset: const Offset(1, 5),
                  ),
                ],
              ),
              height: 60,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        //Farmer profile
                        const Image(
                          image: AssetImage(
                              'assets/rollaine_assets/images/vaugh.png'),
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 15,
                        ),

                        //Farmer name and identity
                        Column(
                          children: [
                            Text(
                              'Vaugh Noe Cabusao',
                              style: Poppins
                                  .userName
                                  .copyWith(
                                color: const Color(
                                    0xFF09041B),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets
                                      .only(
                                      right: 110),
                              child: Text(
                                'Farmer',
                                style: Poppins
                                    .detailsText
                                    .copyWith(
                                  color: const Color(
                                      0xFF09041B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            width: 401),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.edit_square),
                          color: greenNormal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}