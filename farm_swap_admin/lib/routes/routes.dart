import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/admin_account.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/admin_signin.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard.dart';
import 'package:farm_swap_admin/karl_modules/pages/intro_page/intro_page.dart';
import 'package:flutter/material.dart';

import '../karl_modules/pages/admin_signup_page/admin_signup.dart';

class RoutesManager {
//VARIABLES THAT WILL HOLD THE LOCATION OR THE ROUTE
  static const introPage = "/";
  static const signInPage = "/signinpage";
  static const dashboard = "/dashboard";
  static const adminAccount = "/adminaccount";
  static const adminSignUp = "/adminsignup";

//METHOD THAT WILL SWITCH THE ROUTE BASED ON THE PROVIDED ROUTENAME
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //WHEN THE  PUSHNAMED USES INTRO PAGE, THIS WILL BE USED
      case introPage:
        return MaterialPageRoute(
          builder: (context) => const IntroPage(),
        );

      //WHEN THE PUSHNAMED USES SIGNIN PAGE THIS WILL BE USED
      case signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInAdmin(),
        );

      //WHEN THE PUSHNAMED USES DASHBOARD PAGE THIS WILL BE USED
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
        );

      case adminAccount:
        return MaterialPageRoute(
          builder: (context) => const AdminAccount(),
        );

      case adminSignUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );

      default:
        throw const FormatException("No route");
    }
  }
}
