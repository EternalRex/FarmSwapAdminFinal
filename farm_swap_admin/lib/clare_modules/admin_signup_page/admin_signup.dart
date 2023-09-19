import '../admin_signup_page/admin_bio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/admin_signup_textfield_widgets/input/farmswap_textfield.dart';
import '../../../constants/farmswap_typography.dart';
import 'widgets/admin_signup buttons/admin_signup_buttons.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.36,
                  child: Stack(
                    children: [
                      //Svg picture for the farmswap pattern background
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          "assets/svg/Pattern.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      //Image asset for farmswap logo
                      Positioned(
                        top: 47,
                        right: 89,
                        left: 89,
                        child: Center(
                          child: Image.asset("assets/images/Logo.png"),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        right: 89,
                        left: 89,
                        child: Center(
                          child:
                              farmSwapFontTitle(text: "FarmSwap", size: height),
                        ),
                      ),

                      Positioned(
                        top: 200,
                        right: 89,
                        left: 89,
                        child: Center(
                          child: farmSwapFontsubtitle(
                              text: "Modern Barter Solution", size: height),
                        ),
                      ),
                    ],
                  ),
                ),
                // sizedbox for space between the sizedbox and column
                const SizedBox(height: 15),

                // a column for
                Column(
                  children: [
                    farmSwapFont(
                        text: "Sign Up For Free", size: height * 0.024),
                    const SizedBox(height: 20),
                    //a container for the username textfield
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: FarmSwapTextField(
                        hintText: "Username",
                        onPress: () {},
                        inputIcon: "assets/svg/Profile.svg",
                      ),
                    ),
                    SizedBox(height: height * 0.024),

                    //a container for the email textfield
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: FarmSwapTextField(
                        hintText: "Email",
                        onPress: () {},
                        inputIcon: "assets/svg/Message.svg",
                      ),
                    ),
                    SizedBox(height: height * 0.024),

                    //a container for the password textfield
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: FarmSwapTextField(
                        hintText: "Password",
                        onPress: () {},
                        inputIcon: "assets/svg/Lock.svg",
                        isPassword: true,
                      ),
                    )
                  ],
                ),

                SizedBox(height: height * 0.024),
                //tick the checkbox for the terms and condition
                Container(
                  margin: const EdgeInsets.only(left: 510.0),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const Opacity(
                        opacity: 0.50,
                        child: Text(
                          'By signing up, you agree to FarmSwap Terms and Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.67,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //calling class to be used in create button
                const FarmSwapPrimaryButton(
                  buttonTitle: "Create Account",
                  nextScreen: AdminBio(),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(RoutesManager.signInPage);
                  },
                  child: Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFF53E78B),
                        fontSize: height * 0.0147,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: const Color(0xFF53E78B),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
