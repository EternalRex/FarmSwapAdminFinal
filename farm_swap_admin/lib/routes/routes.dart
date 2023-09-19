import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_bio.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_signup.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_uploadphoto.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_verification.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/paymentstatus.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/promotion.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/swapcoinhistory.dart';
import 'package:farm_swap_admin/clare_modules/dashboard_transactions_page/userwallet.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_account.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/screens/admin_signin.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard.dart';
import 'package:farm_swap_admin/karl_modules/pages/intro_page/intro_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/communication.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/listings.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/reports.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/barter_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/logs_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/number_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/selling_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/user_accounts.dart';
import 'package:flutter/material.dart';

import '../clare_modules/admin_signup_page/signup_success_screen.dart';
import '../karl_modules/pages/admin_signup_page/screens/admin_signup.dart';

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

  //rollaine routes
  static const platformPage = '/reportspage';
  static const numberPage = '/numberpage';
  static const barterPage = '/barterpage';
  static const sellingPage = '/sellingpage';
  static const logsPage = '/logspage';

  static const reportsPage = '/reportspage';
  static const userAccountPage = '/useraccountpage';
  static const listingsPage = '/listingspage';
  static const communicationPage = '/communicationpage';

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

      //rollaine pages
      // ignore: unreachable_switch_case
      case platformPage:
        return MaterialPageRoute(
          builder: (context) => const Reports(),
        );

      case numberPage:
        return MaterialPageRoute(
          builder: (context) => const NumberUsers(),
        );

      case barterPage:
        return MaterialPageRoute(
          builder: (context) => const Barter(),
        );

      case sellingPage:
        return MaterialPageRoute(
          builder: (context) => const Selling(),
        );

      case logsPage:
        return MaterialPageRoute(
          builder: (context) => const AdminLogs(),
        );

      // ignore: unreachable_switch_case
      case reportsPage:
        return MaterialPageRoute(
          builder: (context) => const Reports(),
        );

      case userAccountPage:
        return MaterialPageRoute(
          builder: (context) => const UserAccount(),
        );

      case listingsPage:
        return MaterialPageRoute(
          builder: (context) => const Listings(),
        );

      case communicationPage:
        return MaterialPageRoute(
          builder: (context) => const Communication(),
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
