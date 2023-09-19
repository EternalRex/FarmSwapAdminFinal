import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFDA6317),
          ),
          splashColor: const Color(0xFFF9A84D),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 224,
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
    );
  }
}
