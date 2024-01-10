import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_admin/constants/Colors/colors_rollaine.dart";
import "package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/drop_down_update/update_retrieve_docID.dart";
import "package:farm_swap_admin/routes/routes.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import '../../../../../../constants/typography/typography.dart';

/*This is the class for displaying the user NAME, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
// ignore: must_be_immutable
class RequestReactivateScreen extends StatelessWidget {
  RequestReactivateScreen({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('AdminUsers');
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
          String emailAddress =
              data?["Email Address"] ?? "N/A"; // Check if the field exists
          String contactNum =
              data?["Contact Number"] ?? "N/A"; // Check if the field exists
          String userRole =
              data?["User Role"] ?? "N/A"; // Check if the field exists
          String birthPlace =
              data?["Birth Place"] ?? "N/A"; // Check if the field exists
          //convert the timestamp into datetime
          //birthdate is now initialize
          //then set the dateformat
          Timestamp datatimestamp = data["Birth Date"];
          DateTime birthdate = datatimestamp.toDate();
          String finalBirthdate = DateFormat('yyy-MM-dd').format(birthdate);

          //then for the registration date convert sad into date time
          //initialize then set the dateformat
          Timestamp registerdateTM = data["Registration Date"];
          DateTime registerDate = registerdateTM.toDate();
          String finalRegistrationDate =
              DateFormat('yyyy-MM-dd').format(registerDate);

          return Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    //this row holds the value for the role and email address field of the current user
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Role',
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        userRole,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Address",
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        emailAddress,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    //this row holds the value for the firstname and last name field of the current user
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        firstName,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        lastName,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    //this row holds the value for the contact number and address field of the current user
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Number',
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        contactNum,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${data["Address"]}",
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    //this row holds the value for the birthdate and birthplace field of the current user
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //this padding holds the value of the current admin user birth date
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Birth Date",
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        finalBirthdate,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),

                        //this padding holds the value of the current admin user birth place
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Birth Place',
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        birthPlace,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    /*this row is for the last field which is the registration date of the current user
                    and password field
                    */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //this padding holds the value of the current admin user registration date
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Registration Date",
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        finalRegistrationDate,
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        //this padding holds the value of the current admin user password
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: Poppins.contentText.copyWith(
                                  color: const Color.fromARGB(255, 55, 54, 56),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                height: 50,
                                width: 325,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: blackLightActive,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${data["Password"]}",
                                        style: Poppins.farmerName.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: sized_box_for_whitespace
                            Container(
                              height: 50,
                              width: 230,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF53E78B),
                                    Color(0xFF14BE77)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadow,
                                    blurRadius: 5,
                                    offset: const Offset(1, 5),
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: TextButton.icon(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RoutesManager.signInPage);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.signIn,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  "Go back to Log In Page",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

  /*
   * this will retrieve the document id of the specific user id
   * this class is being reused
   */
  UpdateRetriveDocId updateRetrieve = UpdateRetriveDocId();

  /*
  This function will check the account status if it exists 
  */
  Future<String> checkAccountStatus(String userid) async {
    // Retrieve the document ID
    await updateRetrieve.getUpdateDocId(userid);

    // Query Firestore to check the account status
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid)
        .get();

    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        String accountStatus = data['Account Status'] ?? "";
        return accountStatus;
      }
    }

    // If the document doesn't exist or the field is missing, return an empty string
    return "";
  }
}