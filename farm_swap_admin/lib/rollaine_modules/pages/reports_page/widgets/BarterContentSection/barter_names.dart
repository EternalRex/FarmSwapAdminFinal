import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class BarterNames extends StatelessWidget {
  const BarterNames({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/vaugh.png'),
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
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 88,
              ),

              //Date
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '8/17/2023',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),

              //Number barter
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '1',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Farmer name, date of barter transaction, number of barters
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/niyumi.png'),
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
                    'Niyumi Misty Mitsugi',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 107),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 92,
              ),

              //Date
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '8/17/2023',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),

              //Number barter
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '2',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Farmer name, date of barter transaction, number of barters
        Padding(
          padding: const EdgeInsets.only(left: 65, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Farmer profile
              const Image(
                image: AssetImage('assets/rollaine_assets/images/jade.png'),
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 113),
                    child: Text(
                      'Jade Cabusao',
                      style: Poppins.userName.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 177),
                    child: Text(
                      'Farmer',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 23,
              ),

              //Date
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '8/17/2023',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
              const SizedBox(
                width: 17,
              ),

              //Number barter
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  '3',
                  style: Poppins.detailsText.copyWith(
                    color: const Color(0xFF09041B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
