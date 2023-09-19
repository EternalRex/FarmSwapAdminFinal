import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';

class AdminUploadPhoto extends StatefulWidget {
  const AdminUploadPhoto({super.key});

  @override
  State<AdminUploadPhoto> createState() => _AdminUploadPhotoState();
}

class _AdminUploadPhotoState extends State<AdminUploadPhoto> {
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
            Navigator.of(context).pushNamed(RoutesManager.adminAccount);
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
              width: 325,
              height: 129,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x115A6CEA),
                    blurRadius: 50,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Gallery.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Text(
                    'From Gallery',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.81,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
              child: Text('or'),
            ),
            Container(
              width: 325,
              height: 129,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x115A6CEA),
                    blurRadius: 50,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/camera.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Text(
                    'Take Photo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.81,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 29,
            ),
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
                  Navigator.of(context).pushNamed(RoutesManager.adminAccount);
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
