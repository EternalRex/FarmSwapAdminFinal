import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/functions/update_online_status.dart';
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../clare_modules/pages/admin_signup_page/authentication/sign_up_auth.dart';
import '../../../../clare_modules/pages/admin_signup_page/controllers/sign_up_controller.dart';
import '../../../../clare_modules/pages/admin_signup_page/label/sign_up_label.dart';
import '../../../../routes/routes.dart';
import '../../admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
import '../widgets/retrieve_DocID.dart';

class SignInAdmin extends StatefulWidget {
  const SignInAdmin({super.key});

  @override
  State<SignInAdmin> createState() => _SignInAdminState();
}

class _SignInAdminState extends State<SignInAdmin> {
  //create object for controller class
  SignUpController mycontroller = SignUpController();

  //creates the object for the label class
  SignupLabel mylabel = SignupLabel();

  //CREATE OBJECT OF THE ADMIN AUTH
  AdminAuth adminAuth = AdminAuth();

  @override
  void dispose() {
    mycontroller.email.dispose();
    mycontroller.password.dispose();
    mycontroller.userid.dispose();
    super.dispose();
  }

  bool _isPasswordVisible = true; // Initialize it as false initially.

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

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

                  SizedBox(
                    child: Column(
                      children: <Widget>[
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

                        //a container for the email textfield
                        FarmSwapTextField(
                          controller: mycontroller.email,
                          label: mylabel.email,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Message.svg",
                            height: 9,
                            width: 9,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //a container for the password textfield
                        FarmSwapTextField(
                          controller: mycontroller.password,
                          label: mylabel.password,
                          isPassword: _isPasswordVisible,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Lock.svg",
                            height: 9,
                            width: 9,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 46, 184, 76),
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
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
                                    fontSize: 20, fontWeight: FontWeight.w900),
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
                                      .pushNamed(RoutesManager.adminForgotPass);
                                },
                                child: Text(
                                  "Forgot Your Password?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: FarmSwapGreen.darkGreenActive,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/clare_assets/svg/google.svg",
                              ),
                              label: const Text('Google'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(10),
                                fixedSize: const Size(160, 45),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    const Color.fromARGB(255, 85, 84, 84),
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
                                    color: FarmSwapGreen.darkGreenActive,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //this padding contains the log in button where in it calls the log in method to authenticate
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
                                  login();
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

  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

/*An object of the Status Update Class */
  UpdateOnlineStatus onlineStatus = UpdateOnlineStatus();

  void login() async {
    String email = mycontroller.email.text.trim();
    String password = mycontroller.password.text;

    try {
      User? user = await adminAuth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        // Get the document ID
        String documentID = await RetrieveDocId().getDocsId();

        // Check the account status
        String accountStatus = await checkAccountStatus(documentID);

        //if the accountstatus is equal to requesting it will navigate to deactivate page
        if (accountStatus == "Requesting") {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamed(RoutesManager.deactivateaccountpage);
        } else {
          // Update online status and navigate to the dashboard
          onlineStatus.updateOnlineStatus(user.uid, true);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamed(RoutesManager.dashboard);
        }
      }
    } catch (e) {
      throw ("Some error happened in log in");
    }
  }

  /*
  This function will check the account status if it exists it will 
  return the accountStatus which is naa nay value nya ipasa sa log in  na function
  */
  Future<String> checkAccountStatus(String documentID) async {
    // Query Firestore to check the account status
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(documentID)
        .get();

    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        String accountStatus = data['Account Status'] ?? "";
        return accountStatus;
      }
    }

    // If the document doesn't exist or the field is missing, return an empty string
    return "";
  }
}
