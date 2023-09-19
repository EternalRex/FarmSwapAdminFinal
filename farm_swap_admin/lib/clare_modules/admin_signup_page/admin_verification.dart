import 'package:farm_swap_admin/clare_modules/admin_signup_page/verification_success_screen.dart';
import 'package:flutter/material.dart';

import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/admin_signup buttons/admin_signup_buttons.dart';

class VerifycodeScreen extends StatefulWidget {
  const VerifycodeScreen({super.key});

  @override
  State<VerifycodeScreen> createState() => _VerifycodeScreenState();
}

class _VerifycodeScreenState extends State<VerifycodeScreen> {
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
            Navigator.of(context).pushNamed(RoutesManager.adminSignupSuccess);
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
                  width: 239,
                  child: Text(
                    'Enter 4-digit\nVerification code',
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
                  height: 29,
                ),
                const SizedBox(
                  width: 239,
                  child: Text(
                    'Code send to +6282045**** . This code will expired in 01:30',
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
                  height: 39,
                ),
                SizedBox(
                  width: 347,
                  height: 103,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 347,
                          height: 103,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x115A6CEA),
                                blurRadius: 50,
                                offset: Offset(12, 26),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 37,
                        top: 28,
                        child: SizedBox(
                          width: 273,
                          height: 48,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 11,
                                  height: 48,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09051C),
                                      fontSize: 33,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 82,
                                top: 0,
                                child: SizedBox(
                                  width: 20,
                                  height: 48,
                                  child: Text(
                                    '9',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09051C),
                                      fontSize: 33,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 169,
                                top: 0,
                                child: SizedBox(
                                  width: 18,
                                  height: 48,
                                  child: Text(
                                    '2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09051C),
                                      fontSize: 33,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 255,
                                top: 0,
                                child: SizedBox(
                                  width: 18,
                                  height: 48,
                                  child: Text(
                                    '3',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF09051C),
                                      fontSize: 33,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.50,
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
                const SizedBox(
                  height: 39,
                ),
                //calling class to be used in next button
                const FarmSwapPrimaryButton(
                  buttonTitle: "Next",
                  nextScreen: VerifySuccessScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
