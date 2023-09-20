import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/card/farmswap_contactcard.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/dots/forgot_pass_dots.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_subtext.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_text.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/screens/reset_password.dart';
import 'widgets/admin_forgot_pass_buttons/forgot_pass_buttons.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //app bar leading icon button
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFDA6317),
          ),
          splashColor: const Color(0xFFF9A84D),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.signInPage);
          },
        ),

        //appbar transparent background
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          //svg picture for svg background
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
                  width: 230,
                  child: ForgotPassText(
                    myText: "Forgot Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  width: 224,
                  child: ForgotPassSubText(
                    myText:
                        "Select which contact details should we use to reset your password",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                FarmSwapContactCard(
                  width: 290,
                  height: 750,
                  iconPath: "assets/clare_assets/svg/messagechatIcon.svg",
                  title: "Via sms:",
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),

                      //calling the class for the dots
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 14),
                      const ForgotPassTextSms(
                        myText: "4235",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.024),
                FarmSwapContactCard(
                  width: 290,
                  height: 750,
                  iconPath: "assets/clare_assets/svg/Email.svg",
                  title: "Via Email:",
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),

                      //calling the class for the dots
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 4),
                      const ForgotPassDots(),
                      const SizedBox(width: 14),

                      const ForgotPassTextEmail(
                        myText: "@gmail.com",
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 39,
                ),

                //calling class for the next button
                const ForgotPassButton(
                  buttonTitle: "Next",
                  nextScreen: ResetpassScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
