import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:farm_swap_admin/clare_modules/admin_signup_page/admin_uploadphoto.dart';
import 'widgets/admin_signup buttons/admin_signup_buttons.dart';
import 'widgets/admin_signup_textfield_widgets/input/farmswap_textfield.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class AdminBio extends StatefulWidget {
  const AdminBio({super.key});

  @override
  State<AdminBio> createState() => _AdminBioState();
}

class _AdminBioState extends State<AdminBio> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFDA6317),
          ),
          splashColor: const Color(0xFFF9A84D),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.adminSignup);
          },
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.36,
              child: Stack(
                children: [
                  //Svg picture for the farmswap pattern background
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      "assets/svg/Pattern.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    right: 89,
                    left: 89,
                    child: Center(
                      child: Text(
                        'Fill in your bio to get started',
                        style: TextStyle(
                          color: Color(0xFF09041B),
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.31,
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 200,
                    right: 89,
                    left: 89,
                    child: Center(
                      child: Text(
                        'This data will be displayed in your account profile for security.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.81,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // sizedbox for space between the sizedbox and column
            const SizedBox(height: 15),
            FarmSwapTextField(
              hintText: 'First Name',
              onPress: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            FarmSwapTextField(
              hintText: 'Last Name',
              onPress: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            FarmSwapTextField(
              hintText: 'Mobile Number',
              onPress: () {},
            ),
            const SizedBox(
              height: 20,
            ),

            //calling class to be used in next button
            const Center(
              child: FarmSwapPrimaryButton(
                buttonTitle: "Next",
                nextScreen: AdminUploadPhoto(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
