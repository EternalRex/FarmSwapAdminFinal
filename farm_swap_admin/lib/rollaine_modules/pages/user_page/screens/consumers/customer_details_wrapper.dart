import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/rollaine_modules/pages/user_page/database/customers/customer_account_query.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

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
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');

    return FutureBuilder(
      /*In this part kay gigagmit ang value sa documentid na variable para ma access tong document nga
      naa nakasud ang document id nga parehas sa value ni documentid*/
      future: reference.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          dynamic data = snapshot.data!.data() as dynamic;

          //In this part kay need nato i convert ang Firebase na timestamp into datetime ug i format siya sa imo ganahan na format sa date
          Timestamp birthdaytimestamp = data["birthdate"];
          DateTime birthDate = birthdaytimestamp.toDate();
          String bdaybirthdate =
              DateFormat('MM/dd/yyy').format(birthDate);

          //In this part kay need nato i convert ang Firebase na timestamp into datetime ug i format siya sa imo ganahan na format sa date
          Timestamp registertimestamp = data["registrationDate"];
          DateTime registerDate = registertimestamp.toDate();
          String registerbirthdate =
              DateFormat('MM/dd/yyy').format(registerDate);

          final customerImage =
              CachedNetworkImageProvider("${data["profilePhoto"]}");

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
                                width: 20,
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
                                width: 30,
                              ),
                              //Retrieve username of consumers
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data["userName"]}",
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
                                double.parse(data["swapcoins"].toString()).toStringAsFixed(2),
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
                                                          "${data["firstname"]}",
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
                                                          "${data["lastname"]}",
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
                                                          "${data["contactnum"]}",
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
                                                          bdaybirthdate,
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
                                                          "${data["baranggay"]}",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                                  color:
                                                                      greenNormalHover),
                                                        ),
                                                        Text(
                                                          ",",
                                                          style: Poppins
                                                              .farmerName
                                                              .copyWith(
                                                                  color:
                                                                      greenNormalHover),
                                                        ),
                                                        const SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          "${data["city_municipality"]}",
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
                                                          "${data["birthplace"]}",
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),

                                      //Container for document requirement
                                      child: SizedBox(
                                        height: 800,
                                        width: 500,
                                        child: StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection(
                                                  'sample_ConsumerUsers')
                                              .doc(documentId)
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Color(
                                                              0xFF14BE77)),
                                                ),
                                              );
                                            }

                                            if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                    'Error: ${snapshot.error}'),
                                              );
                                            }

                                            if (!snapshot.hasData ||
                                                !snapshot.data!.exists) {
                                              return const Center(
                                                child: Text(
                                                    'Document does not exist.'),
                                              );
                                            }

                                            final String photoUrls =
                                                snapshot.data!.get('idProof');

                                            return PhotoView(
                                              imageProvider:
                                                  NetworkImage(
                                                      photoUrls),
                                              backgroundDecoration:
                                                  const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              minScale: PhotoViewComputedScale
                                                  .contained,
                                              maxScale: PhotoViewComputedScale
                                                      .covered *
                                                  2,
                                            );
                                          },
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
}
