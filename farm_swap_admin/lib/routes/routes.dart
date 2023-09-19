import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_bio.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_signup.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_uploadphoto.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_verification.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/paymentstatus.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/promotion.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/swapcoinhistory.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/userwallet.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/admin_account.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/admin_signin.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/dashboard.dart';
import 'package:farm_swap_admin/karl_modules/pages/intro_page/intro_page.dart';
import 'package:flutter/material.dart';

import '../clare_modules/admin_signup_page/signup_success_screen.dart';
import '../karl_modules/pages/admin_signup_page/admin_signup.dart';

class RoutesManager {
//VARIABLES THAT WILL HOLD THE LOCATION OR THE ROUTE
  static const introPage = "/";
  static const signInPage = "/signinpage";
  static const dashboard = "/dashboard";
  static const adminAccount = "/adminaccount";
  static const adminSignUp = "/adminsignup";

  static const adminTransactionsPayment = "/admintransactionspayment";
  static const adminTransactionsPromotion = "/admintransactionspromotion";
  static const adminTransactionsSwapCoins = "/admintransactionsswapcoins";
  static const adminTransactionsUserWallet = "/admintransactionsuserwallet";

  static const adminSignup = "/adminSignup";
  static const adminSignupSuccess = "/adminSignupSuccess";
  static const adminBio = "/adminbio";
  static const adminUploadPhoto = "/adminuploadphoto";
  static const adminVerification = "/adminverification";

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

      case adminTransactionsPayment:
        return MaterialPageRoute(
          builder: (context) => const PaymentStatusScreen(),
        );

      case adminTransactionsPromotion:
        return MaterialPageRoute(
          builder: (context) => const TransactionPromotion(),
        );

      case adminTransactionsSwapCoins:
        return MaterialPageRoute(
          builder: (context) => const SwapCoinHistory(),
        );

      case adminTransactionsUserWallet:
        return MaterialPageRoute(
          builder: (context) => const UserWalletScreen(),
        );

      case adminSignup:
        return MaterialPageRoute(
          builder: (context) => const AdminSignUpScreen(),
        );

      case adminSignupSuccess:
        return MaterialPageRoute(
          builder: (context) => const SignupSuccessScreen(),
        );

      case adminBio:
        return MaterialPageRoute(
          builder: (context) => const AdminBio(),
        );

      case adminUploadPhoto:
        return MaterialPageRoute(
          builder: (context) => const AdminUploadPhoto(),
        );

      case adminVerification:
        return MaterialPageRoute(
          builder: (context) => const VerifycodeScreen(),
        );
      default:
        throw const FormatException("No route");
    }
  }
}
