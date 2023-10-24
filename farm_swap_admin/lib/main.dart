import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/provider/admin_details_provider.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/provider/update_dropdown_details_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/provider/customer_userId_provider.dart';
import 'package:farm_swap_admin/rollaine_modules/provider/farmer_userId_provider.dart';
import "package:farm_swap_admin/routes/routes.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "karl_modules/pages/admin_account_page/screens/admin_account_logs/provider/adminlogs_provider.dart";
import "karl_modules/pages/admin_account_page/screens/admin_user_details/provider/SpecificAdmin_Archived_provider.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCH_x4XHqGnzdjoe8OwCpeaQ6u9TWtQ3Ec",
        appId: "1:1095006869916:web:247631b47d516f63091059",
        messagingSenderId: "1095006869916",
        projectId: "farmswap-678f3",
        storageBucket: "farmswap-678f3.appspot.com",
        measurementId: "G-CRW82P72M7",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Registering provider for Farmer details
        ChangeNotifierProvider(
          create: (context) => FarmerUserIdProvider(),
        ),
        //Registering provider for Customer details
        ChangeNotifierProvider(
          create: (context) => CustomerUserIdProvider(),
        ),
        /*Registering our provider for Admin Details */
        ChangeNotifierProvider(
          create: (context) => AdminDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminActivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminSpecificArchivedProvider(),
        ),
        /*Registering povider for update account dropdown hint */
        ChangeNotifierProvider(
          create: (context) => UpdateAdminDropDownHint(),
        ),
        ChangeNotifierProvider(create: (context) => FarmerUserIdProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          /*SETTING THE INITIAL ROUTER, OR ROUTE THAT WILL FIRST APPEAR USING THE
        ROUTESMANAGER CLASS AND CALL A PARTICULAR PAGE THAT WE CREATE IN ROUTES.DART CLASS */
          initialRoute: RoutesManager.introPage,
          /* USING THE ROUTES MAANGER CLASS AND CALL THE ROUTES MANAGER METHOD SO THAT
        EVERY TIME THE ROUTES MANAGER SUMMONS A PAGE, THE PAGE NAME WILL BE PUT
        INSIDE THE GENERATE ROUTE AND THEN USED IN THE SWITCH STATEMENT INSIDE THE 
        METHOD TO CHOOSE WHICH PAGE TO GO*/
          onGenerateRoute: RoutesManager.generateRoute,
        );
      },
    );
  }
}
