import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_text.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/screens/admin_signin.dart';
import 'package:flutter_svg/svg.dart';
import '../admin_forgot_pass_buttons/forgot_pass_buttons.dart';

class ResetSuccessScreen extends StatefulWidget {
  const ResetSuccessScreen({super.key});

  @override
  State<ResetSuccessScreen> createState() => _ResetSuccessScreenState();
}

class _ResetSuccessScreenState extends State<ResetSuccessScreen> {
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
                resetPassSuccessTitle(),
                const SizedBox(
                  height: 5,
                ),
                resetPassSuccessSubTitle(),
                const SizedBox(
                  height: 100,
                ),
                //calling class to be used in continue button
                const ForgotPassButton(
                  buttonTitle: "Continue",
                  nextScreen: SignInAdmin(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
