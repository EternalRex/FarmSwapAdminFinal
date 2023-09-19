import 'package:flutter/material.dart';
import '../forgot_password/reset_success_screen.dart';
import '../forgot_password/widgets/admin_signup buttons/admin_signup_buttons.dart';

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
              width: 261,
              child: Text(
                'Reset your password here',
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
              width: 261,
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
              height: 20,
            ),
            //sizedbox for password
            SizedBox(
              width: 347,
              height: 61,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: Color.fromRGBO(83, 232, 140, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 347,
              height: 61,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.50, color: Color(0xFFF4F4F4)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIcon: const Icon(
                    Icons.visibility,
                    color: Color.fromRGBO(83, 232, 140, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 39,
            ),
            //calling class to be used in next button
            const FarmSwapPrimaryButton(
              buttonTitle: "Next",
              nextScreen: ResetSuccessScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
