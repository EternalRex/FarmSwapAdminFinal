import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_admin/constants/Colors/colors_rollaine.dart";
import "package:flutter/material.dart";
import '../../../../../../../constants/typography/typography.dart';

/*This is the class for displaying the archived account, its ways are simillar to the above class
only that it does not use the widget word to access the document id because this class is 
a stateless widget and that it can directly access the constructor varibales */
// ignore: must_be_immutable
class DeactivateAccountDisplay extends StatelessWidget {
  const DeactivateAccountDisplay({
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
          dynamic data = snapshot.data!.data() as dynamic;

          return Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: shadow,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            //this padding holds the status name and account status of specific admin
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Status : ",
                                    style: Poppins.farmerName
                                        .copyWith(color: blackNormal),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    " ${data["Account Status"]}",
                                    style: Poppins.farmerName.copyWith(
                                      color: Color(0xFFFF9800),
                                    ),
                                  ),
                                ],
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
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
