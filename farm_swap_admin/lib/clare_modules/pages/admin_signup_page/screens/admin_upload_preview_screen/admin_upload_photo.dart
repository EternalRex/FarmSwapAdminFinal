import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter_svg/svg.dart';

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
            Navigator.of(context).pushNamed(RoutesManager.adminUploadPhoto);
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/karl_assets/images/admin_signIn_pattern.svg",
            // ignore: deprecated_member_use
            colorBlendMode: BlendMode.screen,
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
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

                //picture
                Container(
                  width: 251,
                  height: 260,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/clare_assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                //to be changed
                IconButton(
                  onPressed: () {
                    uploadImage();
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
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
        ],
      ),
    );
  }

  //to be changed dont mind this and proceed to continue
  Future<void> uploadImage() async {
    try {
      final FileUploadInputElement input = FileUploadInputElement();
      input.accept = "image/*";
      input.click();

      final completer = Completer<String>();

      input.onChange.listen((event) {
        final file = input.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          completer.complete(reader.result as String);
        });
        reader.readAsDataUrl(file);
      });

      final downloadUrl = await completer.future;

      //initialized the user uid
      final userID = FirebaseAuth.instance.currentUser!.uid;

      // Save the download URL to Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final CollectionReference collection = firestore.collection('AdminUsers');
      final DocumentReference document = collection.doc(userID);

      await document.update({
        'Profile Url':
            downloadUrl, // Assuming 'ProfileUrl' is the field where you want to save the photo URL.
      });

      print('Profile image URL has been added to the Firestore document.');
      print(userID);
    } catch (e) {
      print("Profile image has not uploaded successfully");
    }
  }
}
