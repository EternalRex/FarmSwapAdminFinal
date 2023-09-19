import 'package:farm_swap_admin/clare_modules/forgot_password/widgets/card/farmswap_contactcard.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../forgot_password/reset_password.dart';
import '../forgot_password/widgets/admin_signup buttons/admin_signup_buttons.dart';

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
                  width: 230,
                  child: Text(
                    'Forgot password?',
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
                  height: 30,
                ),
                const SizedBox(
                  width: 224,
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
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '4235',
                        style: TextStyle(
                          color: const Color(0xFF09051C),
                          fontSize: height * 0.0197,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
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
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF09051C),
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '@gmail.com',
                        style: TextStyle(
                          color: const Color(0xFF09051C),
                          fontSize: height * 0.0197,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
                /*
                Container(
                  width: 347,
                  height: 105,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x115A6CEA),
                        blurRadius: 50,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 347,
                  height: 81,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x115A6CEA),
                        blurRadius: 50,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
                */
                const SizedBox(
                  height: 39,
                ),

                //calling class to be used in next button
                const FarmSwapPrimaryButton(
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
