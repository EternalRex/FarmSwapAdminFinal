import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class UseruploadPrevScreen extends StatefulWidget {
  const UseruploadPrevScreen({super.key});

  @override
  State<UseruploadPrevScreen> createState() => _UseruploadPrevScreenState();
}

class _UseruploadPrevScreenState extends State<UseruploadPrevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFDA6317),
          ),
          splashColor: const Color(0xFFF9A84D),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutesManager.adminUploadPhoto);
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 264,
              child: Text(
                'Upload Your Photo Profile',
                style: TextStyle(
                  color: Color(0xFF09041B),
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.31,
                ),
              ),
            ),
            const SizedBox(
              width: 264,
              child: Text(
                'This data will be displayed in your account profile for security',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.81,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 251,
              height: 260,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 39,
            ),
            //next button
            Container(
              width: 175,
              height: 57,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.99, -0.15),
                  end: Alignment(-0.99, 0.15),
                  colors: [Color(0xFF53E78B), Color(0xFF14BE77)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RoutesManager.adminSignupSuccess);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.31,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
