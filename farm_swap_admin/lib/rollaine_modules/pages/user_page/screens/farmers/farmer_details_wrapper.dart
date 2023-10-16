import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/farmers/farmer_account_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ReadFarmerDetails extends StatelessWidget {
  ReadFarmerDetails({super.key, required this.documentId});

  final RetrieveFarmerAccounts retrieveFarmerAccounts =
      RetrieveFarmerAccounts();
  String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('FarmerUsers');
    return FutureBuilder(
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;

          Timestamp birthtimestamp = data["birthDate"];
          DateTime birthDate = birthtimestamp.toDate();
          String farmerbirthdate = "${birthDate.month}/${birthDate.day}/${birthDate.year}";

          Timestamp registertimestamp = data["registrationDate"];
          DateTime registerDate = registertimestamp.toDate();
          String registerbirthdate = "${registerDate.month}/${registerDate.day}/${registerDate.year}";

          final farmerImage =
              CachedNetworkImageProvider("${data["profileUrl"]}");
          final documentImage = CachedNetworkImageProvider("${data[""]}");
          final idImage = CachedNetworkImageProvider("${data[""]}");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                //Container sa details na gi retrieve kay farmer
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
                  //Row kung asa nasud ang username, role ug userId
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: farmerImage,
                                    radius: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              //Retrieve the username of farmer
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
                                  //Retrieve the role of the farmer
                                  Text(
                                    "${data["userRole"]}",
                                    style: Poppins.userName.copyWith(
                                      color: const Color(0xFF09041B),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  //Retrieve the user id of farmer
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
                            //Retrieve the profile of farmer
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Container where the personal details of farmer is found
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
                                          //Retrieve status of farmer
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
                                            //Row kung asa masud ang status
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
                                                //Retrieve name which is the first name and last name of farmer
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
                                                //Retrieve contact number of farmers
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
                                                //Retrieve birth date of farmers
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
                                                          farmerbirthdate,
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
                                            //Retrieve registration date when farmers register in the application
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
                                                //Retrieve email address of farmers
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
                                                //Retrieve address of farmers
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
                                                //Retrieve the birth place of farmers
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
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Container(
                                        height: 200,
                                        color: greenLight,
                                        child: CircleAvatar(
                                          backgroundImage: documentImage,
                                          radius: 50,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Container(
                                        height: 200,
                                        color: greenLight,
                                        child: CircleAvatar(
                                          backgroundImage: idImage,
                                          radius: 50,
                                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
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
                                                    onPressed: () {},
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
        //Katong part na before ma display ang gi retrieve na data kay mag loading sa siya
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
}
