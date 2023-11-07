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
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/adminlogs/logs_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/number_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/selling_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/consumers/customer_details.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/consumers/customer_request.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/farmers/farmer_details.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/farmers/farmer_request.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/pending/pending_users.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/user_accounts.dart';
import 'package:flutter/material.dart';
import '../clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/signup_success_screen.dart';
import '../clare_modules/pages/wallet_management_balance/wallet_requests_balance.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_account_logs/wrapper/admin_logs_getID.dart';
import '../karl_modules/pages/admin_account_page/screens/archived_accounts_lists/archived_accounts_list.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_deactivate_account/screen/deactivate_account.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_user_details/admin_requests_reactivation/admin_requests_reactivate.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_user_details/admin_specificDeactivate_Account/wrapper/SpecificAdmin_Deactivate.dart';
import '../karl_modules/pages/admin_account_page/screens/admin_user_details/wrapper/admin_details.dart';
import '../karl_modules/pages/admin_notification_page/screen/admin_notification_screen.dart';

class RoutesManager {
//VARIABLES THAT WILL HOLD THE LOCATION OR THE ROUTE
  static const introPage = "/";
  static const signInPage = "/signinpage";
  static const dashboard = "/dashboard";
  static const adminAccount = "/adminaccount";
  static const adminAccountPage = "/adminaccountpage";
  static const archivedaccountlists = "/archivedaccountlists";
  static const admindetailspage = "/admindetailspage";
  static const deactivateaccountpage = "/deactivateaccountpage";
  static const specificadmindeact = "/specificadmindeact";
  static const requestreactivation = "/requestreactivation";
  static const adminactivityspage = "/adminactivityspage";
  static const adminProfile = "/adminprofile";
  static const adminSignUp = "/adminsignup";
  static const dispute = "/dispute";
  static const chatpage = "/chatpage";
  static const notificationAdminPage = "/adminnotification";

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
  static const farmerrequestwalletpage = "/farmerrequestwalletpage";

  //rollaine routes
  static const platformPage = '/reportspage';
  static const numberPage = '/numberpage';
  static const barterPage = '/barterpage';
  static const sellingPage = '/sellingpage';
  static const logsPage = '/logspage';

  static const reportsPage = '/reportspage';
  static const userAccountPage = '/useraccountpage';
  static const pendingAccountPage = '/pendingaccountpage';
  static const detailsFarmerPage = '/detailsfarmerpage';
  static const detailsCustomerPage = '/detailscustomerpage';
  static const requestFarmer = '/requestreactivatefarmer';
  static const requestCustomer = '/requestreactivatecustomer';
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
          builder: (context) => AdminAccount(),
        );

      case archivedaccountlists:
        return MaterialPageRoute(
          builder: (context) => ArchivedAccountLists(),
        );

      case admindetailspage:
        return MaterialPageRoute(
          builder: (context) => AdminUserDetails(),
        );

      case specificadmindeact:
        return MaterialPageRoute(
          builder: (context) => SpecificAdminDeactivate(),
        );

      case adminactivityspage:
        return MaterialPageRoute(
          builder: (context) => AdminLogsID(),
        );

      case deactivateaccountpage:
        return MaterialPageRoute(
          builder: (context) => const AdminDeactivateAccount(),
        );

      case requestreactivation:
        return MaterialPageRoute(
          builder: (context) => RequestReactivationLists(),
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
          builder: (context) => UserAccount(),
        );

      case pendingAccountPage:
        return MaterialPageRoute(
          builder: (context) => const PendingUserAccounts(),
        );

      case detailsFarmerPage:
        return MaterialPageRoute(
          builder: (context) => DetailsFarmerPage(),
        );

      case detailsCustomerPage:
        return MaterialPageRoute(
          builder: (context) => DetailsCustomerPage(),
        );

      case requestFarmer:
        return MaterialPageRoute(
          builder: (context) => const FarmerRequestPage(),
        );

      case requestCustomer:
        return MaterialPageRoute(
          builder: (context) => const CustomerRequestPage(),
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
      case chatpage:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
        );

//admin notification page
      case notificationAdminPage:
        return MaterialPageRoute(
          builder: (context) => const AdminNotificationScreen(),
        );
      //chat page route
      case chatpage:
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
        );

      //farmer wallet cash in and cash out balance
      case farmerrequestwalletpage:
        return MaterialPageRoute(
          builder: (context) => RequestBalanceFarmerLists(),
        );
      default:
        throw const FormatException("No route");
    }
  }
}
