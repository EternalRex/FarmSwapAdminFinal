import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter_svg/svg.dart';

class VerifySuccessScreen extends StatefulWidget {
  const VerifySuccessScreen({super.key});

  @override
  State<VerifySuccessScreen> createState() => _VerifySuccessScreenState();
}

class _VerifySuccessScreenState extends State<VerifySuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/karl_assets/images/admin_signIn_pattern.svg",
            // ignore: deprecated_member_use
            colorBlendMode: BlendMode.screen,
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 223,
                  height: 210.03,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/clare_assets/images/illustration.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Congrats!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF53E78B),
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.31,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Verification Successful.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF09041B),
                    fontSize: 23,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.31,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                //continue button
                Container(
                  width: 175,
                  height: 57,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.99, -0.15),
                      end: Alignment(-0.99, 0.15),
                      colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutesManager.dashboard);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: const Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 1.31,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
