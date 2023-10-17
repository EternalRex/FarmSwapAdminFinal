import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_admin/constants/Colors/colors_rollaine.dart";
import "package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_editprofile/drop_down_update/personlaInfo_update_retrieveID.dart";
import "package:farm_swap_admin/karl_modules/pages/admin_account_page/screens/admin_user_details/provider/update_dropdown_details_provider.dart";
import "package:farm_swap_admin/routes/routes.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/intl.dart";
import "package:provider/provider.dart";
import '../../../../../../constants/typography/typography.dart';
import "../../screens/admin_user_details/widgets/update_Textfield.dart";

/*This is the class for displaying the user NAME, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
// ignore: must_be_immutable
class EditPersonalInfo extends StatelessWidget {
  EditPersonalInfo({
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
                            top: 10,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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
                                          color: greenNormalHover,
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

                    //a sizedbox a way two seprate the personal info class and the sizedbox
                    const SizedBox(
                      height: 20,
                    ),

                    //sizedbox for update details and archive account buttons
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //update details button
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
                                    width: 141,
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
                                      child: TextButton(
                                        onPressed: () {
                                          selectfieldUpdate(
                                              context, "${data["User Id"]}");
                                        },
                                        child: Text(
                                          "Update Details",
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 3,
                          ),
                          const SizedBox(width: 5),
                          //Archive account button
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
                                    width: 141,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment(0.99, -0.15),
                                        end: Alignment(-0.99, 0.15),
                                        colors: [
                                          Color(0xFFE21B1B),
                                          Color(0xEEFF9012),
                                        ],
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
                                      child: TextButton(
                                        onPressed: () {
                                          //navigator here
                                        },
                                        child: Text(
                                          "Archive Account",
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
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

  String? updatedValue;
  String? selectedValue;
  UpdatePersonalRetriveDocId updateRetrieve = UpdatePersonalRetriveDocId();
  Widget updateLabel = const Text("Type here");
  TextEditingController updateController = TextEditingController();

  void selectfieldUpdate(BuildContext context, String passeduid) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text(
                "Choose Field to Update.",
              ),
              content: DropdownButton<String>(
                value: selectedValue,
                items: [
                  //first menu item first name
                  DropdownMenuItem(
                    value: "firstName",
                    child: GestureDetector(
                        child: const Text(
                          "First Name",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter First Name"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  //calling the function to update the firstname field
                                                  updateFirstNameField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //second menu item last name
                  DropdownMenuItem(
                    value: "lastName",
                    child: GestureDetector(
                        child: const Text(
                          "Last Name",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Last Name"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateLastNameField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //third menu item contact number
                  DropdownMenuItem(
                    value: "contactNumber",
                    child: GestureDetector(
                        child: const Text(
                          "Contact Number",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Contact Number"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateContactNumberField(
                                                      context,
                                                      updatedValue,
                                                      passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //third menu item address
                  DropdownMenuItem(
                    value: "address",
                    child: GestureDetector(
                        child: const Text(
                          "Address",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Address"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateAddressField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //fourth menu item birthdate
                  DropdownMenuItem(
                    value: "birthdate",
                    child: GestureDetector(
                      child: const Text("Birth Date"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Select Birthdate"),
                              content: SizedBox(
                                height: 30,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: GestureDetector(
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            _selectDateBirth(
                                                context, passeduid);
                                          },
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          label: const Text(
                                            'Select Date',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(10),
                                            fixedSize: const Size(
                                              180,
                                              20,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.black,
                                            elevation: 15,
                                            shadowColor: shadow,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //Update field button
                                        DecoratedBox(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF53E78B),
                                                Color(0xFF14BE77),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(17.50),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              disabledForegroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.38),
                                              disabledBackgroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.12),
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {
                                              updateBirthdate(context,
                                                  birthdate, passeduid);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Text(
                                                'Update Field',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),

                  //fifth menu item birth place
                  DropdownMenuItem(
                    value: "birthplace",
                    child: GestureDetector(
                        child: const Text(
                          "Birth Place",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Birth Place"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateBirthplaceField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //sixth menu item registration date
                  DropdownMenuItem(
                    value: "registrationdate",
                    child: GestureDetector(
                      child: const Text("Registration Date"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Select Registration Date"),
                              content: SizedBox(
                                height: 30,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: GestureDetector(
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            _selectDateReg(context, passeduid);
                                          },
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          label: const Text(
                                            'Select Date',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(10),
                                            fixedSize: const Size(
                                              180,
                                              20,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            backgroundColor: Colors.lightBlue,
                                            foregroundColor: Colors.black,
                                            elevation: 15,
                                            shadowColor: shadow,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //Update field button
                                        DecoratedBox(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF53E78B),
                                                Color(0xFF14BE77),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(17.50),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              disabledForegroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.38),
                                              disabledBackgroundColor: Colors
                                                  .transparent
                                                  .withOpacity(0.12),
                                              shadowColor: Colors.transparent,
                                            ),
                                            onPressed: () {
                                              updateRegistrationDate(context,
                                                  registerdate, passeduid);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Text(
                                                'Update Field',
                                                style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),

                  //seventh menu item email address
                  DropdownMenuItem(
                    value: "emailAddress",
                    child: GestureDetector(
                        child: const Text(
                          "Email Address",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter Email Address"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: false,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updateEmailField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),

                  //eight menu item password
                  DropdownMenuItem(
                    value: "password",
                    child: GestureDetector(
                        child: const Text(
                          "New Password",
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Enter New Password"),
                                  content: UpdateTextfield(
                                    label: updateLabel,
                                    updateControllerField: updateController,
                                    textType: true,
                                  ),
                                  actions: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            //Update field button
                                            DecoratedBox(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color(0xFF53E78B),
                                                    Color(0xFF14BE77),
                                                  ],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17.50),
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  disabledForegroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.38),
                                                  disabledBackgroundColor:
                                                      Colors.transparent
                                                          .withOpacity(0.12),
                                                  shadowColor:
                                                      Colors.transparent,
                                                ),
                                                onPressed: () {
                                                  updatedValue =
                                                      updateController.text;
                                                  updatePasswordField(context,
                                                      updatedValue, passeduid);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Text(
                                                    'Update Field',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.50,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }),
                  ),
                ],
                onChanged: (value) {
                  selectedValue = value;
                  Provider.of<UpdateAdminDropDownHint>(context, listen: false)
                      .setHint(value!);
                },
              ));
        });
  }

  //creating a function called updated firstname field to update the first name from the database
  Future<void> updateFirstNameField(
      BuildContext context, String? updatedata, String userid) async {
    //calling the getUpdateddocID function from the class UpdateRetrieve
    await updateRetrieve.getUpdateDocId(userid);

    /*Tapo didto gihapon sa  UpdateFirstNameRetriveDocId na clas ang kanang function na atong bag e gi call
    mo return nag string value which is ang documentid nga iyang gi butang sa variable nga mydocid*/
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"First Name": updatedata};

    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.adminProfile);
  }

  //the function updateLastNameField is the same process as what the other function does
  Future<void> updateLastNameField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Last Name": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateAddressField is the same process as what the other function does
  Future<void> updateAddressField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);

    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Address": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateContactNumberField is the same process as what the other function does
  Future<void> updateContactNumberField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Contact Number": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function updateBirthplace field is the same process as what the other function does
  Future<void> updateBirthplaceField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Birth Place": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function update email address field is the same process as what the other function does
  Future<void> updateEmailField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Email Address": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //the function update password field is the same process as what the other function does
  Future<void> updatePasswordField(
      BuildContext context, String? updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);

    final updateFiled = {"Password": updatedata};
    /*
    after the updated data is being naay sud ma update na na siya adtu sa database 
    then navigate to admin user details of the specific admin
    */
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.admindetailspage);
  }

  //create a variable date time for the register date nad birthdate
  DateTime registerdate = DateTime.now();
  DateTime birthdate = DateTime.now();

  //a function for selecting date birth
  Future<void> _selectDateBirth(BuildContext context, String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: birthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != birthdate) {
      birthdate = pickedDate;
    }
  }

  /*Function for updating birthdate*/
  Future<void> updateBirthdate(
      BuildContext context, DateTime updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);
    final updateFiled = {"Birth Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.adminProfile);
  }

  //a function for selecting date birth
  Future<void> _selectDateReg(BuildContext context, String userid) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: registerdate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null && pickedDate != registerdate) {
      registerdate = pickedDate;
    }
  }

  /*Function for updating register date*/
  Future<void> updateRegistrationDate(
      BuildContext context, DateTime updatedata, String userid) async {
    await updateRetrieve.getUpdateDocId(userid);
    final documentref = FirebaseFirestore.instance
        .collection('AdminUsers')
        .doc(updateRetrieve.mydocid);
    final updateFiled = {"Registration Date": updatedata};
    await documentref.update(updateFiled);
    Navigator.of(context).pushNamed(RoutesManager.adminProfile);
  }
}
