import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'reset_success_screen.dart';
import '../admin_forgot_pass_buttons/forgot_pass_buttons.dart';

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
                SizedBox(
                  width: 261,
                  child: resetPassTitle(text: "Reset Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 261,
<<<<<<< HEAD
                  child: resetPassSubTitle(
                    myText:
                        "Select which contact details should we use to reset your password",
                  ),
=======
                  //Clare ako lang gi butangan ug my text kay naka required man nya error dili ko maka padagan
                  child: resetPassSubTitle(myText: '',),
>>>>>>> 4dec5f812e2725b345e7d0f1f15aacbb4108ce6b
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
