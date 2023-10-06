import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/widgets/success_button.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/widgets/success_picture.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/widgets/success_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignupSuccessPicture(),
                SizedBox(
                  height: 30,
                ),
                SignupSuccessText(),
                SizedBox(
                  height: 5,
                ),
                SignupSuccessText1(),
                SizedBox(
                  height: 100,
                ),

                //continue button directed to  dashboard page
                SignupSuccessButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
