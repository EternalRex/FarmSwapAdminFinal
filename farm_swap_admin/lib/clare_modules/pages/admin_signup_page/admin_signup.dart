import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/widgets/admin_signup_textfield_widgets/farmswap_textfield.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../../../karl_modules/pages/admin_account_page/screens/admin_account_logs/database/admin_logs_insert.dart';
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

  TextEditingController regdate = TextEditingController();
  TextEditingController bdate = TextEditingController();

  @override
  void dispose() {
    mycontroller.accountstatus.dispose();
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
    mycontroller.confirmpassword.dispose();
    mycontroller.profile.dispose();
    super.dispose();
  }

  //radio button
  bool isChecked = false;

  @override
  void initState() {
    mycontroller = SignUpController(); // Initialize the controller here
    regdate.text = "";
    super.initState();
  }

  // Initialize it as false initially.
  bool _isPasswordVisible = true;
  bool _isPasswordVisible1 = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _togglePasswordVisibility1() {
    setState(() {
      _isPasswordVisible1 = !_isPasswordVisible1;
    });
  }

  // Define a boolean variable to track if the password field has been focused
  bool isPasswordFocused = false;
  bool isEmailAvailable = true;
  bool isEmailInvalid = false;
// Track the validity of the contact number
  bool isContactNumberValid = true;
  // Track if the user has inputted a contact number
  bool hasContactNumberInput = false;

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
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: height * 0.024),

                        //a textfield for the first name, lastname, contact number
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FarmSwapTextField(
                              controller: mycontroller.fname,
                              label: mylabel.fname,
                              isPassword: false,
                              prefixIcon: SvgPicture.asset(
                                "assets/clare_assets/svg/Profile.svg",
                                height: 9,
                                width: 9,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            //address
                            FarmSwapTextField(
                              controller: mycontroller.address,
                              label: mylabel.address,
                              isPassword: false,
                              prefixIcon: const Image(
                                image: AssetImage(
                                  "assets/clare_assets/images/location.png",
                                ),
                                height: 9,
                                width: 9,
                              ),
                            ),

                            const SizedBox(
                              width: 40,
                            ),

                            //email
                            Column(
                              children: [
                                FarmSwapTextField(
                                  controller: mycontroller.email,
                                  label: mylabel.email,
                                  isPassword: false,
                                  prefixIcon: SvgPicture.asset(
                                    "assets/clare_assets/svg/Message.svg",
                                    height: 9,
                                    width: 9,
                                  ),
                                  onChanged: (email) async {
                                    setState(() {
                                      isEmailAvailable = false;
                                      isEmailInvalid = email.isNotEmpty
                                          ? !isValidEmail(email)
                                          : false;
                                    });

                                    // Call the function to check email availability
                                    bool isAvailable =
                                        await checkEmailExistsField(email);

                                    // Update the UI based on the availability status
                                    setState(() {
                                      isEmailAvailable = isAvailable;
                                    });
                                  },
                                ),
                                Text(
                                  isEmailInvalid
                                      ? 'Invalid email format. \nPlease enter a valid email address.'
                                      : (isEmailAvailable
                                          ? ''
                                          : 'Email already exists!'),
                                  style: TextStyle(
                                    color: isEmailInvalid
                                        ? Colors.red
                                        : (isEmailAvailable
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.024),

                        //a sizedbox for the address, birth date and birthplace
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //a textfield for the last name
                            FarmSwapTextField(
                              controller: mycontroller.lname,
                              label: mylabel.lname,
                              isPassword: false,
                              prefixIcon: SvgPicture.asset(
                                "assets/clare_assets/svg/profile.svg",
                                height: 9,
                                width: 9,
                              ),
                            ),

                            const SizedBox(
                              width: 40,
                            ),
                            //birthplace textfield
                            FarmSwapTextField(
                              controller: mycontroller.birthplace,
                              label: mylabel.birthplace,
                              isPassword: false,
                              prefixIcon: const Image(
                                image: AssetImage(
                                  "assets/clare_assets/images/location.png",
                                ),
                                height: 9,
                                width: 9,
                              ),
                            ),

                            const SizedBox(
                              width: 40,
                            ),
                            //password
                            Column(
                              children: [
                                //a textfield for the password
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
                                      color: const Color.fromARGB(
                                          255, 46, 184, 76),
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      // Set the flag to true when the user types
                                      isPasswordFocused = true;
                                    });
                                  },
                                ),
                                // Display error message below the password field only if it has been focused and password is not empty
                                if (isPasswordFocused &&
                                    mycontroller.password.text.isNotEmpty)
                                  Text(
                                    !isPasswordValid(mycontroller.password.text)
                                        ? "Password is weak! password must contain at least  \none number, one letter, and one special character."
                                        : "",
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.024),

                        //a textfield for the email, pass and confirm pass
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                //a texfield for the contact number
                                FarmSwapTextField(
                                  controller: mycontroller.contactnum,
                                  label: mylabel.contactnumber,
                                  isPassword: false,
                                  prefixIcon: const Image(
                                    image: AssetImage(
                                      "assets/clare_assets/images/contact.png",
                                    ),
                                    height: 9,
                                    width: 9,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')), // Allow only digits
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  onChanged: (contactNumberController) {
                                    setState(() {
                                      hasContactNumberInput =
                                          contactNumberController.isNotEmpty;
                                      isContactNumberValid =
                                          contactNumberController.length ==
                                                  11 &&
                                              RegExp(r'^[0-9]+$').hasMatch(
                                                  contactNumberController);
                                    });
                                  },
                                ),
                                // Display a message based on the contact number validity and user input
                                Text(
                                  hasContactNumberInput
                                      ? (isContactNumberValid
                                          ? ''
                                          : 'Please enter only numbers and exactly 11 digits.')
                                      : '', // Display nothing if no user input
                                  style: TextStyle(
                                    color: isContactNumberValid
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              width: 40,
                            ),
                            //birthdate field
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
                                        color:
                                            Color.fromARGB(255, 50, 202, 108)),
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

                                  prefixIcon: const Image(
                                    image: AssetImage(
                                      "assets/clare_assets/images/Calendar.png",
                                    ),
                                    height: 9,
                                    width: 9,
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
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

                                    // Check if the user is below 18 years old
                                    if (isBelow18(pickedDate)) {
                                      // Display a message that the user is below 18 and cannot sign up
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Sorry, you must be 18 years or older to sign up.'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      return; // Exit the onTap function to prevent further processing
                                    }

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

                            const SizedBox(
                              width: 40,
                            ),
                            //confirm password
                            Column(
                              children: [
                                //a textfield for the confirm password
                                FarmSwapTextField(
                                  controller: mycontroller.confirmpassword,
                                  label: const Text("Confirm password"),
                                  isPassword: _isPasswordVisible1,
                                  prefixIcon: SvgPicture.asset(
                                    "assets/clare_assets/svg/Lock.svg",
                                    height: 9,
                                    width: 9,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible1
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color.fromARGB(
                                          255, 46, 184, 76),
                                    ),
                                    onPressed: _togglePasswordVisibility1,
                                  ),
                                  onChanged: (value) {
                                    setState(
                                        () {}); // Trigger a rebuild when the user types
                                  },
                                ),
                                // Display error message below the confirm password field
                                Text(
                                  !doPasswordsMatch(mycontroller.password.text,
                                          mycontroller.confirmpassword.text)
                                      ? "Your password and confirm password must match."
                                      : "",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /**a padding where it holds the create account button 
                   * and it calls the register function 
                  to save the sign up data to firestore
                  */
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
                            width: 145,
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
                                  // Call the register function when the button is pressed
                                  register();
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

                  //this textbutton will navigate to sign in page if user click the already have an account
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

  bool isValidEmail(String email) {
    // Use a regular expression to check if the email is in the correct format
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  // Validate password function
  bool isPasswordValid(String password) {
    String pattern = r'^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  // Validate password match function
  bool doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  // Validate form function
  bool isFormValid(String password, String confirmPassword) {
    bool isValidPassword = isPasswordValid(password);
    bool passwordsMatch = doPasswordsMatch(password, confirmPassword);
    return isValidPassword && passwordsMatch;
  }

  //this function will validate the inputted password
  bool validateForm() {
    String password = mycontroller.password.text;
    String confirmPassword = mycontroller.confirmpassword.text;

    if (!isFormValid(password, confirmPassword)) {
      // Form is not valid, show an error message or take appropriate action
      if (!isPasswordValid(password)) {
        print(
            "Password must contain at least one number, one letter, and one special character.");
      }
      if (password.length < 8) {
        // Password is too short, print an error message or show a SnackBar
        print("Password must be at least 8 characters long.");
      }

      if (!doPasswordsMatch(password, confirmPassword)) {
        print("Passwords do not match.");
      }

      return false;
    } else {
      // Form is valid, proceed with your logic
      print("Password match");
      return true;
    }
  }

  // Function to check if the user is below 18 years old
  bool isBelow18(DateTime birthdate) {
    DateTime currentDate = DateTime.now();
    DateTime eighteenYearsAgo =
        currentDate.subtract(const Duration(days: 18 * 365));

    return birthdate.isAfter(eighteenYearsAgo);
  }

  //Object for the admin logs model used to save admin logs to db
  AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

  //when register is called it uploads the image url
  void register() async {
    // Set the flag to indicate that registration is in progress

    String email = mycontroller.email.text.trim();
    String password = mycontroller.password.text;
    String confirmpass = mycontroller.confirmpassword.text;
    String contactNumber = mycontroller.contactnum.text.trim();
    String firstName = mycontroller.fname.text.trim();
    String lastName = mycontroller.lname.text.trim();
    String address = mycontroller.address.text.trim();
    String birthDate = bdate.text.trim();
    String birthPlace = mycontroller.birthplace.text.trim();

    // Check if any field is empty
    if (email.isEmpty ||
        password.isEmpty ||
        contactNumber.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        address.isEmpty ||
        birthDate.isEmpty ||
        birthPlace.isEmpty) {
      // Display a message that all fields are required
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('All fields are required.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Exit the function to prevent further processing
    }

    // Check if the contact number has exactly 11 digits
    if (mycontroller.contactnum.text.length != 11) {
      // Display a text indicating that the contact number should have 11 digits
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contact number should have exactly 11 digits.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Exit the function to prevent further processing
    } else if (!isContactNumberValid && hasContactNumberInput) {
      // Display a text indicating that the contact number should contain only numbers
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Contact number should contain only numbers.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Exit the function to prevent further processing
    }

    // Check if the email is in the right format
    if (!validator.email(email)) {
      // Display a text indicating that the email is not in the right format
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Invalid email format. Please enter a valid email address.'),
          backgroundColor: Colors.red,
        ),
      );
      return; // Exit the function to prevent further processing
    }

    try {
      // Check if the email already exists
      bool emailExists = await checkEmailExists(email);

      if (emailExists) {
        // Display a text indicating that the email already exists
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Email already exists. Please use a different email.'),
            backgroundColor: Colors.red,
          ),
        );
        return; // Exit the function to prevent further processing
      }

      if (doPasswordsMatch(password, confirmpass)) {
        User? user = await adminAuth.signUpWithEmailAndPassword(
          email,
          password,
        );
        user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          String uid = user.uid;
          // Show loading dialog
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 8),
                    Text("Creating account..."),
                  ],
                ),
              );
            },
          );

          // Store the User UID in Firestore
          // await uploadImage(uid);
          await storeUidInFirestore(uid);

          /*So mag kuha ni siya sa admin logs nya iyang description kay ni create account */
          adminLogs.createAdminLogs(
              email,
              FirebaseAuth.instance.currentUser!.uid,
              "Create_Account",
              DateTime.now());

          print("User is successfully created");

          // Close the loading dialog
          Navigator.of(context, rootNavigator: true).pop();

          Navigator.of(context).pushNamed(RoutesManager.adminUploadPhoto);
        }
      } else if (!doPasswordsMatch(password, confirmpass)) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please check your password!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Some error happened");
    } finally {}
  }

  Future<bool> checkEmailExists(String email) async {
    // Reference to the users collection in Firestore
    CollectionReference users =
        FirebaseFirestore.instance.collection('AdminUsers');

    // Query for the user with the given email
    QuerySnapshot querySnapshot =
        await users.where('Email Address', isEqualTo: email).get();

    // If there is at least one document with the given email, it exists
    return querySnapshot.docs.isNotEmpty;
  }

  //this will check if the email exists, this is case sensitive
  Future<bool> checkEmailExistsField(
    String email,
  ) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('AdminUsers')
          .where('Email Address', isEqualTo: email)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      // Handle errors, e.g., connection issues, etc.
      print('Error checking email availability: $e');
      return false;
    }
  }

  /// This function stores the UID as a field in that document.
  Future<void> storeUidInFirestore(String uid) async {
    try {
      //String userid = uid;
      String status = mycontroller.accountstatus.text;
      String profile = mycontroller.profile.text;
      String role = mycontroller.role.text;
      DateTime registerdate = DateTime.now();

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
        profile: profile,
        accountstatus: status,
        online: true,
      );

      await addAdminUser1.createUser(addAdmin);
      print('UID stored in Firestore successfully.');
    } catch (e) {
      print('Error storing UID in Firestore: $e');
    }
  }
}
