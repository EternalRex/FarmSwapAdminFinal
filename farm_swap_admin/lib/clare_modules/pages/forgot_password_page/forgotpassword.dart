import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/Textfield/forgotpass_textfield.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/widgets/text/forgot_pass_text.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/screens/admin_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/routes.dart';
import '../../../karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import 'widgets/Text/forgot_pass_subtext.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  //create object for controller
  TextEditingController emailController = TextEditingController();
  //create object for label
  Widget emailLabel = const Text("Email");

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
                //header text
                SizedBox(
                  width: 261,
                  child: resetPassTitle(text: "Forgot Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                //subtitle text
                const SizedBox(
                  width: 261,
                  child: ForgotPassSubText(
                    myText: "Enter your email to reset password.",
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                //this textfield holds the email text
                ForgotPassTextfield(
                  controller: emailController,
                  label: emailLabel,
                  isPassword: false,
                  prefixIcon: SvgPicture.asset(
                    "assets/clare_assets/svg/Message.svg",
                    height: 15,
                    width: 15,
                  ),
                ),

                SizedBox(height: height * 0.024),

                //check email button
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
                                checkEmail();
                              },
                              child: Text(
                                "Check Email",
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

  //function checks if a given email address exists in the 'AdminUsers' Firestore collection
  //by querying the collection and returning true if a matching document is found
  //and false if no matching document is found.
  Future<bool> doesEmailExist(String email) async {
    final QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection('AdminUsers')
        .where('Email Address', isEqualTo: email)
        .get();

    return result.docs.isNotEmpty;
  }

  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

  final email = FirebaseAuth.instance.currentUser?.email ?? '';

  //this calls the function doesEmailExist
  //and if email exist it shows the dialog box
  void checkEmail() async {
    final enteredEmail = emailController.text.trim();
    final emailExists = await doesEmailExist(enteredEmail);

    if (emailExists) {
      try {
        //this will send link to the admin users to reset the password
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: enteredEmail,
        );

        //this dialog will prompt if the email exist in the firestore
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Email Found!'),
              content: const Text(
                  "The entered email exists. Please check your email."
                  "Click 'OK' to proceed with resetting the password."),
              actions: [
                TextButton(
                  onPressed: () {
                    /*So mag kuha ni siya sa admin logs nya iyang description kay ni password reset */
                    adminLogs.createAdminLogs(
                        email,
                        FirebaseAuth.instance.currentUser!.uid,
                        "Password_Reset",
                        DateTime.now());
                    //when ok textbutton pressed this dialog box will navigate to the sign in page
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return const SignInAdmin();
                    }));
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        print("Error sending password reset email: $e");
      }
    } else {
      // this dialog will prompt if
      //Email does not exist in Firestore, then show an error message
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Email Not Found!'),
            content: const Text('The entered email does not exist.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
