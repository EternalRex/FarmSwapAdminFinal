import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:flutter/material.dart';

class LogsNames extends StatelessWidget {
  const LogsNames({super.key});

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
              CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/rollaine_assets/images/rian.png'),
                radius: 20,
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Rian Rey Barriga',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text(
                      'Admin',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 91,
              ),

              //Date
              Text(
                '8/6/2023',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 80,
              ),

              //Time
              Text(
                '6:40PM',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 64,
              ),

              //Section
              Text(
                'Listings',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
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
              CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/rollaine_assets/images/karl.jpg'),
                radius: 20,
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Karl Eve Mar Modequillo',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 133),
                    child: Text(
                      'Admin',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 37,
              ),

              //Date
              Text(
                '7/24/2023',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 75,
              ),

              //Time
              Text(
                '10:19AM',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 63,
              ),

              //Section
              Text(
                'Admin Account',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
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
              CircleAvatar(
                backgroundImage:
                    const AssetImage('assets/rollaine_assets/images/clare.jpg'),
                radius: 20,
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Clare Nicor',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text(
                      'Admin',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 134,
              ),

              //Date
              Text(
                '7/27/2023',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 76,
              ),

              //Time
              Text(
                '3:30PM',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 65,
              ),

              //Section
              Text(
                'Dispute',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
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
              CircleAvatar(
                backgroundImage: const AssetImage(
                    'assets/rollaine_assets/images/rollaine.png'),
                radius: 20,
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(
                width: 15,
              ),

              //Farmer name and identity
              Column(
                children: [
                  Text(
                    'Rollaine Kaye Obejero',
                    style: Poppins.userName.copyWith(
                      color: const Color(0xFF09041B),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 118),
                    child: Text(
                      'Admin',
                      style: Poppins.detailsText.copyWith(
                        color: const Color(0xFF09041B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 52,
              ),

              //Date
              Text(
                '7/30/2023',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 75,
              ),

              //Time
              Text(
                '2:29PM',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
              const SizedBox(
                width: 66,
              ),

              //Section
              Text(
                'Transactions',
                style: Poppins.detailsText.copyWith(
                  color: const Color(0xFF09041B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
