import 'dart:async';
import 'dart:html';
import 'dart:ui';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'authentication/sign_up_auth.dart';
import 'controllers/sign_up_controller.dart';
import 'database/sign_up_query.dart';
import 'label/sign_up_label.dart';
import 'models/sign_up_models.dart';
import 'widgets/text/signup_typography.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  //create object for controller class
  SignUpController mycontroller = SignUpController();

  //creates the object for the label class
  SignupLabel mylabel = SignupLabel();

  //create object of the admin authentication
  AdminAuth adminAuth = AdminAuth();

  //create object of the admin query
  AddAdminUser addAdminUser1 = AddAdminUser();

  //Variables for Date and Time
  //DateTime registerdate = DateTime.now();
  //DateTime birthdate = DateTime.now();

  TextEditingController regdate = TextEditingController();
  TextEditingController bdate = TextEditingController();

  @override
  void dispose() {
    mycontroller.role.dispose();
    regdate.dispose();
    mycontroller.fname.dispose();
    mycontroller.lname.dispose();
    mycontroller.address.dispose();
    mycontroller.contactnum.dispose();
    bdate.dispose();
    mycontroller.birthplace.dispose();
    mycontroller.email.dispose();
    mycontroller.password.dispose();
    mycontroller.profile.dispose();
    super.dispose();
  }

  //radio button
  bool isChecked = false;

  @override
  void initState() {
    regdate.text = "";
    super.initState();
  }

  bool _isPasswordVisible = true; // Initialize it as false initially.

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            "assets/karl_assets/images/admin_signIn_pattern.svg",
            // ignore: deprecated_member_use
            colorBlendMode: BlendMode.screen,
            height: 450,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  const Image(
                    image: AssetImage(
                      "assets/clare_assets/images/logo.png",
                    ),
                    height: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  farmSwapFontTitle(text: "FarmSwap", size: height),
                  farmSwapFontsubtitle(
                      text: "Modern Barter Solution", size: height),
                  const SizedBox(height: 25),
                  farmSwapFont(
                    text: "Sign Up For Free",
                    size: 16,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        //a container for the user role textfield
                        FarmSwapTextField(
                          controller: mycontroller.role,
                          label: mylabel.userrole,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a sizedbox for the registration date textfield
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: regdate,
                            cursorColor: FarmSwapGreen.normalGreen,
                            selectionHeightStyle:
                                BoxHeightStyle.includeLineSpacingBottom,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              filled: true,
                              fillColor: Colors.white,

                              labelText: "Register Date",

                              //border designs
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Color(0xFFF4F4F4)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50,
                                    color: Color.fromARGB(255, 50, 202, 108)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: SvgPicture.asset(
                                "assets/clare_assets/svg/Profile.svg",
                                height: 20,
                                width: 20,
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                              );

                              if (pickedDate != null) {
                                //print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                //print(formattedDate);
                                setState(() {
                                  regdate.text =
                                      formattedDate; // Update the text in the controller
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a container for the first name textfield
                        FarmSwapTextField(
                          controller: mycontroller.fname,
                          label: mylabel.fname,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a container for the last name textfield
                        FarmSwapTextField(
                          controller: mycontroller.lname,
                          label: mylabel.lname,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a container for the contact number textfield
                        FarmSwapTextField(
                          controller: mycontroller.contactnum,
                          label: mylabel.contactnumber,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a container for the birth date textfield
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: bdate,
                            cursorColor: FarmSwapGreen.normalGreen,
                            selectionHeightStyle:
                                BoxHeightStyle.includeLineSpacingBottom,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              filled: true,
                              fillColor: Colors.white,

                              labelText: "Birth Date",

                              //border designs
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Color(0xFFF4F4F4)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50,
                                    color: Color.fromARGB(255, 50, 202, 108)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.50, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),

                              prefixIcon: SvgPicture.asset(
                                "assets/clare_assets/svg/Lock.svg",
                                height: 20,
                                width: 20,
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                              );

                              if (pickedDate != null) {
                                //print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                //print(formattedDate);
                                setState(() {
                                  bdate.text =
                                      formattedDate; // Update the text in the controller
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        FarmSwapTextField(
                          controller: mycontroller.address,
                          label: mylabel.address,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //birthplace textfield
                        FarmSwapTextField(
                          controller: mycontroller.birthplace,
                          label: mylabel.birthplace,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Profile.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),

                        SizedBox(height: height * 0.024),
                        //a container for the email textfield
                        FarmSwapTextField(
                          controller: mycontroller.email,
                          label: mylabel.email,
                          isPassword: false,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Message.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                        SizedBox(height: height * 0.024),

                        //a container for the password textfield
                        FarmSwapTextField(
                          controller: mycontroller.password,
                          label: mylabel.password,
                          isPassword: _isPasswordVisible,
                          prefixIcon: SvgPicture.asset(
                            "assets/clare_assets/svg/Lock.svg",
                            height: 20,
                            width: 20,
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
                        SizedBox(height: height * 0.024),

                        //to be changed
                        //currently working on...
                        IconButton(
                          onPressed: () {
                            register();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                          ),
                        ),

                        //tick the checkbox for the terms and condition
                        Container(
                          margin: const EdgeInsets.only(
                            left: 510.0,
                          ),
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
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //create account button
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
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
                                  //register();
                                  Navigator.of(context).pushNamed(
                                      RoutesManager.adminUploadPhoto);
                                },
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 15,
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

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutesManager.signInPage);
                    },
                    child: const SignupHaveAccountFont(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //when register is called it uploads the image url
  void register() async {
    String email = mycontroller.email.text.trim();
    String password = mycontroller.password.text;

    try {
      User? user = await adminAuth.signUpWithEmailAndPassword(
        email,
        password,
      );
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        // Store the User UID in Firestore
        await uploadImage(uid);

        print("User is successfully created");
        //Navigator.of(context).pushNamed(RoutesManager.adminUploadPhoto);
      }
    } catch (e) {
      print("Some error happened");
    }
  }

  /// This function stores the profileurl as a field in that document.
  Future<void> uploadImage(uid) async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    // Store the download URL in Firestore
    await storeUidInFirestore(uid, downloadUrl);
  }

  /// This function stores the UID as a field in that document.
  Future<void> storeUidInFirestore(String uid, String profileUrl) async {
    try {
      //String userid = uid;
      String role = mycontroller.role.text;
      String register = regdate.text;
      DateTime registerdate = DateTime.parse(register);

      String fname = mycontroller.fname.text;
      String lname = mycontroller.lname.text;
      String address = mycontroller.address.text;
      String contactnum = mycontroller.contactnum.text;
      String birthday = bdate.text;
      DateTime birthdate = DateTime.parse(birthday);

      String birthplace = mycontroller.birthplace.text;

      String email = mycontroller.email.text.trim();
      String password = mycontroller.password.text;

      final addAdmin = AdminUserModel(
        userid: uid,
        userrole: role,
        regdate: registerdate,
        firstname: fname,
        lastname: lname,
        address: address,
        contactnum: contactnum,
        birthdate: birthdate,
        birthplace: birthplace,
        email: email,
        password: password,
        profile: profileUrl,
      );

      await addAdminUser1.createUser(addAdmin);
      print('UID stored in Firestore successfully.');
    } catch (e) {
      print('Error storing UID in Firestore: $e');
    }
  }
}
