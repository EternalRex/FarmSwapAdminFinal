import "dart:async";
import "dart:convert";
import "dart:html";
import "dart:typed_data";

import "package:cached_network_image/cached_network_image.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_admin/clare_modules/pages/admin_signup_page/database/retrieve_DocumentID.dart";
import "package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_editprofile/admin_editprofile.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import '../../../admin_account_logs/database/admin_logs_insert.dart';

/*We created this class to be called in the dashboard this will take a value which 
is the document id we get from our firebase query. That is why this class has a 
constructor required documentID*/

class ProfilePhotoAccount extends StatefulWidget {
  const ProfilePhotoAccount({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  State<ProfilePhotoAccount> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhotoAccount> {
  @override
  Widget build(BuildContext context) {
    /*We create a reference to our firestore collection so that we can acces it*/
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');

    /*Test print the document Id  if it has really a value, we used the word widget here to 
    access the documentID variable because it is on another class because we are using stateful here */
    print(widget.documentId);

    return FutureBuilder<DocumentSnapshot>(
      /*we are going to access our documents in firebase but first we need to await for
      the value of document id which will be given from our dasboard where we call this class */
      future: reference.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          /*Creating a dynamic variable and store and store the data we get from our querry which
          we aceessed using the word snapshot */
          dynamic data = snapshot.data!.data() as dynamic;
          final profileUrl = data["profileUrl"];

          if (profileUrl != null && profileUrl.isNotEmpty) {
            /*Display the image */
            final image = CachedNetworkImageProvider("${data["profileUrl"]}");
            return Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: image,
                ),
                Positioned(
                  top: 48,
                  left: 50,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      selectUploadImage();
                    },
                  ),
                ),
              ],
            );
          } else {
            return Stack(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person, // Specify the icon
                    size: 60, // Adjust the size of the icon
                    color: Colors.white, // Set the icon color
                  ),
                ),
                Positioned(
                  top: 48,
                  left: 50,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      selectUploadImage();
                    },
                  ),
                ),
              ],
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // Variable to store the selected image data.
  Uint8List? _selectedImage;
  String? imageUrl;

  //a function to select image and upload image to database
  Future<void> selectUploadImage() async {
    try {
      final FileUploadInputElement input = FileUploadInputElement();
      input.accept = "image/*";
      input.click();

      /*This is for da  purpose of displaying the image after it was selected */
      final completer = Completer<Uint8List>();
      /*This is for da saving the image as a string into the databae */
      //final completer2 = Completer<String>();

      input.onChange.listen((event) {
        final file = input.files!.first;
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          final dataUrl = reader.result as String;
          //completer2.complete(reader.result as String);
          final base64String = dataUrl.split(',').last;
          completer.complete(Uint8List.fromList(base64Decode(base64String)));
        });
        reader.readAsDataUrl(file);
      });

      /*variable to be used for da Uint8 for da display of image here */
      final selectedImage = await completer.future;

      /**
      if selected image is not null it will call the 
      uploadImage to save the string url to database
       */
      // ignore: unnecessary_null_comparison
      if (selectedImage != null) {
        _selectedImage = selectedImage;
        await uploadImage();
      } else {
        print("Image selection failed.");
      }
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
        //Object for the admin logs model used to save admin logs to db
        AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();
        final email = FirebaseAuth.instance.currentUser!.email;

        /*So mag kuha ni siya sa admin logs nya iyang description kay ni profile phot0 */
        adminLogs.createAdminLogs(email, FirebaseAuth.instance.currentUser!.uid,
            "Update_Profile_Photo", DateTime.now());

        // Pass the download URL to the "Dashboard" page
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const AdminEditProfile(),
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

/*This is the class for displaying the user ID, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
class ProfileId extends StatelessWidget {
  const ProfileId({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    /*We create a reference to our firestore collection so that we can acces it*/
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');

    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;
          return Padding(
            padding: const EdgeInsets.all(6),
            child: Center(
              child: SizedBox(
                child: Text(
                  "ID: ${data["User Id"]}",
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

/*This is the class for displaying the user NAME, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
class ProfileAccountName extends StatelessWidget {
  const ProfileAccountName({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    print(documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          dynamic data = snapshot.data!.data() as dynamic;
          String firstName =
              data?["First Name"] ?? "N/A"; // Check if the field exists
          String lastName =
              data?["Last Name"] ?? "N/A"; // Check if the field exists

          return Center(
            child: Row(
              children: [
                Text(
                  firstName,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  lastName,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

/*This is the class for displaying the user ROLE, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
class ProfileAdminRole extends StatelessWidget {
  const ProfileAdminRole({super.key, required this.documentId});

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
    print(documentId);
    return FutureBuilder<DocumentSnapshot>(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          dynamic data = snapshot.data!.data() as dynamic;
          String userRole =
              data?["User Role"] ?? "N/A"; // Check if the field exists
          return Center(
            child: Text(
              userRole,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
