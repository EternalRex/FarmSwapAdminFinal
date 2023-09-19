import '../admin_signup_page/admin_bio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/admin_signup_textfield_widgets/input/farmswap_textfield.dart';
import '../../../constants/farmswap_typography.dart';
import 'widgets/admin_signup buttons/admin_signup_buttons.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  State<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends State<AdminSignUpScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(),
    );
  }
}
