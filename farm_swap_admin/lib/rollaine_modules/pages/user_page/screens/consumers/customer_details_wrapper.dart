import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/customers/customer_account_query.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/screens/consumers/customer_images_wrapper.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ReadCustomerDetails extends StatelessWidget {
  ReadCustomerDetails({super.key, required this.documentId});

  //Naa tay object para maka access sa methods diri sa RetrieveCustomerAccounts na class
  final RetrieveCustomerAccounts retrieveCustomerAccounts =
      RetrieveCustomerAccounts();

  //Variable na document id nga String
  String documentId;

  @override
  Widget build(BuildContext context) {
    //mag create ug reference sa database firestore
    CollectionReference reference =
        FirebaseFirestore.instance.collection('CustomerUsers');

    return FutureBuilder(
      /*In this part kay gigagmit ang value sa documentid na variable para ma access tong document nga
      naa nakasud ang document id nga parehas sa value ni documentid*/
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;

          //In this part kay need nato i convert ang Firebase na timestamp into datetime ug i format siya sa imo ganahan na format sa date
          Timestamp registertimestamp = data["registrationDate"];
          DateTime registerDate = registertimestamp.toDate();
          String registerbirthdate =
              DateFormat('MM/dd/yyy').format(registerDate);

          final customerImage =
              CachedNetworkImageProvider("${data["profileUrl"]}");

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                //Container sa details na gi retrieve kay consumer
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadow,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),

                  //In this part kay diri naka sulod ang first row sa details ni consumer
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  //Profile image of the consumer
                                  CircleAvatar(
                                    backgroundImage: customerImage,
                                    radius: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              //Retrieve username of consumers
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data["username"]}",
                                    style: Poppins.farmerName.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  //Retrieve role of consumers
                                  Text(
                                    "${data["userRole"]}",
                                    style: Poppins.userName.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  //Retrieve the user id of consumer
                                  Text(
                                    "${data["userId"]}",
                                    style: Poppins.detailsText.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Swap coins status of consumer
                              Text(
                                'Swap Coins:',
                                style: Poppins.contentText
                                    .copyWith(color: const Color(0xFF09041B)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${data["swapCoins"]}",
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
                  height: 10,
                ),
                //Container where the personal details of consumer is found
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadow,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),

                  //Second row of consumer details
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //Status ni consumer
                                          Text(
                                            'Status',
                                            style: Poppins.contentText.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 55, 54, 56),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: blackLightActive,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignOutside),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${data["accountStatus"]}",
                                                    style: Poppins.farmerName
                                                        .copyWith(
                                                      color: greenNormalHover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve name which is the first name and last name of consumers
                                                Text(
                                                  'Name',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          //First name
                                                          "${data["firstName"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                            color:
                                                                greenNormalHover,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        //Last name
                                                        Text(
                                                          "${data["lastName"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                            color:
                                                                greenNormalHover,
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
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve contact number of consumers
                                                Text(
                                                  'Contact Number',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${data["contactNumber"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                            color:
                                                                greenNormalHover,
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
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve birth date of consumers
                                                Text(
                                                  'Birth Date',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${data["birthDate"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                            color:
                                                                greenNormalHover,
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
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            //Retrieve registration date when consumers register in the application
                                            'Registration Date',
                                            style: Poppins.contentText.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 55, 54, 56),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: blackLightActive,
                                                  strokeAlign: BorderSide
                                                      .strokeAlignOutside),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    registerbirthdate,
                                                    style: Poppins.farmerName
                                                        .copyWith(
                                                            color:
                                                                greenNormalHover),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve email address of consumers
                                                Text(
                                                  'Email Address',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${data["email"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                                  color:
                                                                      greenNormalHover),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve address of consumers
                                                Text(
                                                  'Address',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${data["address"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                                  color:
                                                                      greenNormalHover),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Retrieve the birth place of consumers
                                                Text(
                                                  'Birth Place',
                                                  style: Poppins.contentText
                                                      .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 55, 54, 56),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color: blackLightActive,
                                                        strokeAlign: BorderSide
                                                            .strokeAlignOutside),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${data["birthPlace"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                            color:
                                                                greenNormalHover,
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
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadow,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),

                  //Third row of consumer details kung asa ang iya mga gi pasa na document photos
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        children: [
                                          //Attachments
                                          Text(
                                            'Attachments',
                                            style: Poppins.contentText.copyWith(
                                                color: const Color.fromARGB(
                                                    255, 55, 54, 56)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),

                                      //Container for document requirement
                                      child: SizedBox(
                                        height: 800,
                                        width: 500,
                                        child: ReadCustomerImage(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: shadow,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),

                  //Fourth row kung asa ang mga buttons gi butang
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            //Update button wherein you can archive, suspend, and deduct swap coins
                                            child: Row(
                                              children: [
                                                DecoratedBox(
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xFF53E78B),
                                                        Color(0xFF14BE77),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      disabledForegroundColor:
                                                          Colors.transparent
                                                              .withOpacity(
                                                                  0.38),
                                                      disabledBackgroundColor:
                                                          Colors.transparent
                                                              .withOpacity(
                                                                  0.12),
                                                      shadowColor:
                                                          Colors.transparent,
                                                    ),
                                                    onPressed: () {
                                                      selectButtonToUpdate(
                                                          context);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5),
                                                      child: Text(
                                                        'Update',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: Colors.white,
                                                          fontSize: 14,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
          );
        }
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Color(0xFF14BE77),
            ),
          ),
        );
      },
    );
  }

  /*This function is defined with the name selectButtonToUpdate, and it takes a BuildContext argument, 
  which is used to determine where the dialog should be displayed in the widget tree.*/
  void selectButtonToUpdate(BuildContext context) {
    //Used to display a dialog box, typically an AlertDialog, on the screen
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //Title of the showDialog
          title: Text(
            'Update Account',
            style: Poppins.contentTitle.copyWith(
              color: const Color(0xFF09041B),
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 260,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),

                    //Archive button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF00B4D8),
                                Color(0xFF0077B6),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Archive',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),

                    //Suspend button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF0182C),
                                Color(0xFFD1001F),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Suspend',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),

                    //Deduction button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFFB347),
                                Color(0xFFFA9C1B),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledForegroundColor:
                                  Colors.transparent.withOpacity(0.38),
                              disabledBackgroundColor:
                                  Colors.transparent.withOpacity(0.12),
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Deduction',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10,
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),

                            //Save button
                            child: Row(
                              children: [
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
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      disabledForegroundColor:
                                          Colors.transparent.withOpacity(0.38),
                                      disabledBackgroundColor:
                                          Colors.transparent.withOpacity(0.12),
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Text(
                                        'Save',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10,
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
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),

                            //Cancel button
                            child: Row(
                              children: [
                                DecoratedBox(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF88807B),
                                        Color(0xFF787276),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      disabledForegroundColor:
                                          Colors.transparent.withOpacity(0.38),
                                      disabledBackgroundColor:
                                          Colors.transparent.withOpacity(0.12),
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          RoutesManager.detailsCustomerPage);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Text(
                                        'Cancel',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 10,
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
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
