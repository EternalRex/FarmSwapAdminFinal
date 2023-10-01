import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:google_fonts/google_fonts.dart";

import '../../../../constants/Colors/colors.dart';
import '../../../../routes/routes.dart';

class SignInAdmin extends StatefulWidget {
  const SignInAdmin({super.key});

  @override
  State<SignInAdmin> createState() => _SignInAdminState();
}

class _SignInAdminState extends State<SignInAdmin> {
  /*VARIABLES THAT ARE USED IN THE SINGINTEXT FIELD WIDGET SINCE WE NEED A 
 DIFFERENT LABEL FOR THE TWO TXT FIELDS WE MAKE TWO WIDGETS WITH A TEXT THAT
 CONTAINS THE LABEL AND THEN PASS THIS TO THE LABEL PROPERTY OF OUR TEXT FIELD HERE */
  Widget emailLabel = const Text("Email");
  Widget passwordLabel = const Text("Password");
  TextInputType textType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*THE SVG PICTURE THAT IS THE BACKGROUND OF THE PAGE */
          SvgPicture.asset(
            "assets/karl_assets/images/admin_signIn_pattern.svg",
            // ignore: deprecated_member_use
            colorBlendMode: BlendMode.screen,
            height: 450,
            width: MediaQuery.of(context).size.width,
          ),
          //VERTICALLY CENTERING EVERY ELEMENT OF THE SOON TO BE COLUMN
          Center(
            /*A COLUMN THAT WILL CONTAIN THE ELEMENTS VERTICALLY */
            child: SingleChildScrollView(
              child: Column(
                /*HORIZONTALLY CENTERING ALL THE ELEMENTS OF THE COLUMN */
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //THE FARMSWAP LOGO
                  const Image(
                    image: AssetImage(
                      "assets/karl_assets/images/logo3.png",
                    ),
                    height: 100,
                  ),
                  /*FARMSWAP TITLE */
                  Text(
                    "FarmSwap",
                    style: GoogleFonts.viga(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.50,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            Color(0xFF53E78B),
                            Color(0xFF14BE77),
                          ],
                        ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                        ),
                    ),
                  ),
                  /*FARM SWAP DESCRIPTION */
                  Text(
                    "Modern Barter Solution",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF09051C),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                  ),
                  /*SIZED BOX THAT GIVES SPACE BETWEEN THE DESCRIPTION AND THE
                LOGIN TITLE */
                  const SizedBox(
                    height: 30,
                  ),
                  /*LOG IN ACCOUNT TITLE */
                  Text(
                    "Login To Your Account",
                    style: TextStyle(
                      color: const Color(0xFF09041B),
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  /*GIVES A 20 HEIGHT SPACE BETWEEN THE LOGIN TITLE AND THE EMAIL TEXT BOX */
                  const SizedBox(
                    height: 20,
                  ),
                  /*CONTAINS TEXT FIELD SO THAT WE CAN MANIPULATE THE WIDTH OF THE EMAIL TEXT FIELD */
                  /* SizedBox(
                    height: 57,
                    width: 325,
                    /*HAS A LABEL PROPERTY FOR EMAIL THAT WILL TAKE VALUE FROM THE WIDGET
                    VARIABLES I SET ABOVE, THAT LABEL PROPERTY IS SET FROM THE SING_IN_TEXT_FIELD CLASS*/
                    child: SignInTxtField(
                      textType: false,
                      label: emailLabel,
                    ),
                  ),*/

                  //a container for the email textfield
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: FarmSwapTextField(
                      hintText: "Email",
                      onPress: () {},
                      inputIcon: "assets/clare_assets/svg/Message.svg",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

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
                  const SizedBox(
                    height: 15,
                  ),
                  /* /*CONTAINS TEXT FIELD SO THAT WE CAN MANIPULATE THE WIDTH OF THE PASSWORD TEXT FIELD */
                  SizedBox(
                    height: 57,
                    width: 325,
                    /*HAS A LABEL PROPERTY FOR PASSWORD THAT WILL TAKE VALUE FROM THE WIDGET
                    VARIABLES I SET ABOVE, THAT LABEL PROPERTY IS SET FROM THE SING_IN_TEXT_FIELD CLASS*/
                    child: SignInTxtField(
                      textType: true,
                      label: passwordLabel,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  */
                  /*LABEL ON CHOOSING TO CONTINUE WITH FACEBOOK OR GOOGLE */
                  Text(
                    "Or continue with",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  /*VERTICALLY CENTERING THE ROW THAT WILL CONTAIN THE CONTAINERS
                  THAT WILL HOLD THE FACEBOOK AND GOOGLE ICON */
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 470),
                        child: Expanded(
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.facebook),
                                label: const Text('Facebook'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  fixedSize: const Size(160, 45),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.blue,
                                  elevation: 15,
                                  shadowColor: shadow,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(RoutesManager.adminSignup);
                                  },
                                  child: Text(
                                    "Forgot Your Password?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: farmSwapTitlegreen,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Expanded(
                          child: Column(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(FontAwesomeIcons.google),
                                label: const Text('Google'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(10),
                                  fixedSize: const Size(160, 45),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.red,
                                  elevation: 15,
                                  shadowColor: shadow,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(RoutesManager.adminSignup);
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: farmSwapTitlegreen,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
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
                  const SizedBox(
                    height: 20,
                  ),
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
                                  /*PUSHES A ROUTENAME INTO THE ROUTEMANAGER.GENERATE ROUTE */
                                  Navigator.of(context)
                                      .pushNamed(RoutesManager.dashboard);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
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
          ),
        ],
      ),
    );
  }
}
