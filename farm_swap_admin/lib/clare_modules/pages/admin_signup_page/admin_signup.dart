import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_bio_screen/admin_bio.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup%20buttons/admin_signup_buttons.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/text/signup_typography.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/clare_assets/images/logo.png",
                    ),
                  ),
                  farmSwapFontTitle(text: "FarmSwap", size: height),
                  farmSwapFontsubtitle(
                      text: "Modern Barter Solution", size: height),
                  const SizedBox(height: 15),
                  farmSwapFont(
                    text: "Sign Up For Free",
                    size: 16,
                  ),
                  const SizedBox(height: 20),

                  //a container for the username textfield
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Username",
                      onPress: () {},
                      inputIcon: "assets/clare_assets/svg/Profile.svg",
                    ),
                  ),
                  SizedBox(height: height * 0.024),

                  //a container for the email textfield
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Email",
                      onPress: () {},
                      inputIcon: "assets/clare_assets/svg/Message.svg",
                    ),
                  ),
                  SizedBox(height: height * 0.024),

                  //a container for the password textfield
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Password",
                      onPress: () {},
                      inputIcon: "assets/clare_assets/svg/Lock.svg",
                      isPassword: true,
                    ),
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
                        Opacity(
                          opacity: 0.50,
                          child: signupTermsConditionFont(),
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

                    //calling the class for the the text
                    child: const SignupHaveAccountFont(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
