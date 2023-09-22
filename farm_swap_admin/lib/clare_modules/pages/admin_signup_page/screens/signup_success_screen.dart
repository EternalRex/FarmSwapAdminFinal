import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'admin_verification_screen/admin_verification.dart';
import '../widgets/admin_signup buttons/admin_signup_buttons.dart';

class SignupSuccessScreen extends StatefulWidget {
  const SignupSuccessScreen({super.key});

  @override
  State<SignupSuccessScreen> createState() => _SignupSuccessScreenState();
}

class _SignupSuccessScreenState extends State<SignupSuccessScreen> {
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
                  'Your Profile Is Ready To Use',
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

                //calling class to be used in continue button
                const FarmSwapPrimaryButton(
                  buttonTitle: "Continue",
                  nextScreen: VerifycodeScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
