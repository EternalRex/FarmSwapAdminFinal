import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/database/retrieve_DocumentID.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_signup_success_screen/signup_success_screen.dart';
import 'package:farm_swap_admin/clare_modules/pages/admin_signup_page/screens/admin_upload_photo/widgets/uploadPhoto_Text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/screens/dashboard.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
            Navigator.of(context).pushNamed(RoutesManager.adminSignUp);
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
                  width: 290,
                  child: UploadPhotoText(),
                ),
                const SizedBox(
                  width: 264,
                  child: UploadPhotoText1(),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // This part will display the selected image.
                    if (_selectedImage != null)
                      Image.memory(
                        _selectedImage!,
                        width: 300,
                        height: 300,
                      ),
                    IconButton(
                      onPressed: () {
                        //calling the function to select an image and preview
                        selectImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ],
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
                      uploadImage();
                      // Navigator.of(context).pushReplacement(
                      // MaterialPageRoute(
                      // builder: (context) => const SignupSuccessScreen(),
                      //),
                      //);
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

  // Variable to store the selected image data.
  Uint8List? _selectedImage;

  //a function to select image
  Future<void> selectImage() async {
    try {
      final FileUploadInputElement input = FileUploadInputElement();
      input.accept = "image/*";
      input.click();

      final completer = Completer<Uint8List>();

      input.onChange.listen((event) {
        final file = input.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          final dataUrl = reader.result as String;
          final base64String = dataUrl.split(',').last;
          completer.complete(Uint8List.fromList(base64Decode(base64String)));
        });
        reader.readAsDataUrl(file);
      });

      final selectedImage = await completer.future;

      // Store the selected image data.
      setState(() {
        _selectedImage = selectedImage;
      });
    } catch (e) {
      print("Profile image has not uploaded successfully");
    }
  }

  //a function to upload the image
  Future<void> uploadImage() async {
    try {
      if (_selectedImage == null) {
        // Handle the case where no image is selected.
        return;
      }

      // Initialize Firebase Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final CollectionReference collection = firestore.collection('AdminUsers');

      // Create an instance of DashboardRetrieveSpecificID
      final dashboardRetrieve = RetrieveDocID();

      // Retrieve the document ID using the getDocsId method
      final String documentId = await dashboardRetrieve.getDocsId();

      // Generate a unique filename
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final fileName = 'images/$timestamp.jpg';

      // Upload the image to Firebase Storage
      final storage = FirebaseStorage.instance;
      final Reference storageReference = storage.ref().child(fileName);

      try {
        // Upload the image
        final UploadTask uploadTask = storageReference.putData(_selectedImage!);
        final TaskSnapshot taskSnapshot = await uploadTask;
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // Pass the download URL to the "Dashboard" page
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignupSuccessScreen(),
          ),
        );

        // Define the data to be added to the Firestore document
        final Map<String, dynamic> data = {
          'profileUrl': downloadUrl,
        };

        // Update the 'ProfileUrl' field in the Firestore document
        await collection.doc(documentId).update(data);

        print(
            'Profile image URL has been updated in the Firestore document with ID: $documentId');
      } catch (e) {
        print("Profile image has not uploaded successfully: $e");
      }
    } catch (e) {
      print("Upload Image Failed!");
    }
  }
}
