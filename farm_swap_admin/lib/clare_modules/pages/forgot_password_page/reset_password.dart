import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/screens/reset_success_screen.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/Textfield/forgotpass_textfield.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/buttons/forgot_pass_buttons.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
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
            // Navigator.of(context).pushNamed(RoutesManager.adminForgotPass);
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
                SizedBox(
                  width: 261,
                  child: resetPassTitle(text: "Reset Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 261,
                  child: resetPassSubTitle(
                    myText:
                        "Select which contact details should we use to reset your password",
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

                //calling class for the next button
                const ForgotPassButton(
                  buttonTitle: "Next",
                  nextScreen: ForgotPassSuccessScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
