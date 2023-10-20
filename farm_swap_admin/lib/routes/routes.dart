// ignore_for_file: unreachable_switch_case
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_upload_photo/admin_upload_photo.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/admin_signup.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_verification_screen/admin_verification.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/paymentstatus.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/promotion.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/swapcoinhistory.dart';
import 'package:farm_swap_admin/clare_modules/pages/dashboard_transactions_page/screens/userwallet.dart';
import 'package:farm_swap_admin/clare_modules/pages/forgot_password_page/forgotpassword.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/admin_account.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_editprofile/admin_editprofile.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/screens/admin_signin.dart';
import 'package:farm_swap_admin/karl_modules/pages/chat_page/screens/main_%20chat_screen.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/dispute.dart';
import 'package:farm_swap_admin/karl_modules/pages/intro_page/intro_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/communication.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/listings.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/reports.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/barter_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/logs_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/number_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/selling_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/consumers/customer_details.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/farmers/farmer_details.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/user_accounts.dart';
import 'package:flutter/material.dart';
import '../clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/signup_success_screen.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_user_details/wrapper/admin_details.dart';

class RoutesManager {
//VARIABLES THAT WILL HOLD THE LOCATION OR THE ROUTE
  static const introPage = "/";
  static const signInPage = "/signinpage";
  static const dashboard = "/dashboard";
  static const adminAccount = "/adminaccount";
  static const adminAccountPage = "/adminaccountpage";
  static const admindetailspage = "/admindetailspage";
  static const adminProfile = "/adminprofile";
  static const adminSignUp = "/adminsignup";
  static const dispute = "/dispute";
  static const chatpage = "/chatpage";

  //clare routes
  static const adminSignup = "/adminSignup";
  static const adminSignupSuccess = "/adminSignupSuccess";
  static const adminUploadPhoto = "/adminuploadphoto";
  static const adminVerification = "/adminverification";

  static const adminForgotPass = "/adminforgotpass";
  static const resetpassscreensuccess = "/adminresetpasssuccess";

  static const adminTransactionsPayment = "/admintransactionspayment";
  static const adminTransactionsPromotion = "/admintransactionspromotion";
  static const adminTransactionsSwapCoins = "/admintransactionsswapcoins";
  static const adminTransactionsUserWallet = "/admintransactionsuserwallet";

  //rollaine routes
  static const platformPage = '/reportspage';
  static const numberPage = '/numberpage';
  static const barterPage = '/barterpage';
  static const sellingPage = '/sellingpage';
  static const logsPage = '/logspage';

  static const reportsPage = '/reportspage';
  static const userAccountPage = '/useraccountpage';
  static const detailsFarmerPage = '/detailsfarmerpage';
  static const detailsCustomerPage = '/detailscustomerpage';
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

      case admindetailspage:
        return MaterialPageRoute(
          builder: (context) => AdminUserDetails(),
        );

      case adminProfile:
        return MaterialPageRoute(
          builder: (context) => const AdminEditProfile(),
        );

      case dispute:
        return MaterialPageRoute(
          builder: (context) => const Dispute(),
        );

      //rollaine pages
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

      case userAccountPage:
        return MaterialPageRoute(
          builder: (context) => const UserAccount(),
        );

      case detailsFarmerPage:
        return MaterialPageRoute(
          builder: (context) => const DetailsFarmerPage(),
        );

      case detailsCustomerPage:
        return MaterialPageRoute(
          builder: (context) => const DetailsCustomerPage(),
        );

      case listingsPage:
        return MaterialPageRoute(
          builder: (context) => const Listings(),
        );

      case communicationPage:
        return MaterialPageRoute(
          builder: (context) => const Communication(),
        );

      //Transactions routes
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

      //sign up process routes
      case adminSignup:
        return MaterialPageRoute(
          builder: (context) => const AdminSignUpScreen(),
        );

      case adminSignupSuccess:
        return MaterialPageRoute(
          builder: (context) => const SignupSuccessScreen(),
        );

      case adminUploadPhoto:
        return MaterialPageRoute(
          builder: (context) => const AdminUploadPhoto(),
        );

      case adminVerification:
        return MaterialPageRoute(
          builder: (context) => const VerifycodeScreen(),
        );
      case adminForgotPass:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassScreen(),
        );
      //chat page route
      case chatpage:
        return MaterialPageRoute(builder: (context) => const ChatPage());
      default:
        throw const FormatException("No route");
    }
  }
}
