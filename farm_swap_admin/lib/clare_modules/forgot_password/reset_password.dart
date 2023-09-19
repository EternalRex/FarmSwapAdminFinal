import 'package:farm_swap_admin/clare_modules/admin_signup_page/widgets/admin_signup_textfield_widgets/input/farmswap_textfield.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../forgot_password/reset_success_screen.dart';
import '../forgot_password/widgets/admin_signup buttons/admin_signup_buttons.dart';

class ResetpassScreen extends StatefulWidget {
  const ResetpassScreen({super.key});

  @override
  State<ResetpassScreen> createState() => _ResetpassScreenState();
}

class _ResetpassScreenState extends State<ResetpassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFDA6317),
          ),
          splashColor: const Color(0xFFF9A84D),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.adminForgotPass);
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
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
                const SizedBox(
                  width: 261,
                  child: Text(
                    'Reset your password here',
                    style: TextStyle(
                      color: Color(0xFF09041B),
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.31,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 261,
                  child: Text(
                    'Select which contact details should we use to reset your password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.81,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //a container for the new password textfield
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FarmSwapTextField(
                    hintText: "New Password",
                    onPress: () {},
                    inputIcon: "assets/clare_assets/svg/Lock.svg",
                    isPassword: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //a container for the confirm password textfield
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FarmSwapTextField(
                    hintText: "Confirm Password",
                    onPress: () {},
                    inputIcon: "assets/clare_assets/svg/Lock.svg",
                    isPassword: true,
                  ),
                ),

                const SizedBox(
                  height: 39,
                ),
                //calling class to be used in next button
                const FarmSwapPrimaryButton(
                  buttonTitle: "Next",
                  nextScreen: ResetSuccessScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
