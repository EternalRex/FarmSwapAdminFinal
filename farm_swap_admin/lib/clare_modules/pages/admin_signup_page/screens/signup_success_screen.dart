import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                /* FarmSwapPrimaryButton(
                  buttonTitle: "Continue",
                  onPress: () {
                    Navigator.of(context).pushNamed(RoutesManager.signInPage);
                  },
                ),
                */

                //continue button directed to sign in page
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 50,
                          width: 141,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: shadow,
                                blurRadius: 5,
                                offset: const Offset(1, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                //PUSHES A ROUTENAME INTO THE ROUTEMANAGER.GENERATE ROUTE
                                Navigator.of(context)
                                    .pushNamed(RoutesManager.signInPage);
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
