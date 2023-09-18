import 'package:farm_swap_admin/rollaine_modules/pages/user_page/user_accounts.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/communication_page/communication.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/listings_page/listings.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/reports.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/barter_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/logs_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/number_page.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/reports_page/screens/selling_page.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static const platformPage = '/';
  static const numberPage = '/numberpage';
  static const barterPage = '/barterpage';
  static const sellingPage = '/sellingpage';
  static const logsPage = '/logspage';

  static const reportsPage = '/reportspage';
  static const userAccountPage ='/useraccountpage';
  static const listingsPage ='/listingspage';
  static const communicationPage ='/communicationpage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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

      default:
        throw const FormatException('No Route');
    }
  }
}
