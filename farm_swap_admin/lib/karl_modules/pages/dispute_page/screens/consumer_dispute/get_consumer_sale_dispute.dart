import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/consumer_dispute/consumer_dispute_sale_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GetConsumerSaleDispute extends StatefulWidget {
  const GetConsumerSaleDispute({super.key});

  @override
  State<GetConsumerSaleDispute> createState() => _GetConsumerSaleDisputeState();
}

class _GetConsumerSaleDisputeState extends State<GetConsumerSaleDispute> {
  final _firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebase
          .collectionGroup('cSaleDispute')
          .orderBy('disputeDate', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs
                  .map<Widget>(
                      (document) => _buildCCompleteBarterListItems(document))
                  .toList(),
            );
          }
        }
        return const Center(
          child: Text('No Transactions'),
        );
      },
    );
  }

  Widget _buildCCompleteBarterListItems(DocumentSnapshot document) {
    Map<String, dynamic> sale = document.data() as Map<String, dynamic>;

    String conusmerBarangay = sale['consumerBarangay'];
    String consumerId = sale['consumerId'];
    String consumerLname = sale['consumerLName'];
    String consumerMuniciplaity = sale['consumerMuniciplaity'];
    String consumerName = sale['consumerName'];
    String consumerUname = sale['consumerUname'];
    String consumerUrl = sale['consumerUrl'];
    Timestamp disputeDate = sale['disputeDate'];
    String disputeStatus = sale['disputeStatus'];
    String disputeText = sale['disputeText'];
    String disputeUrl = sale['disputeUrl'];
    String farmerBarangay = sale['farmerBarangay'];
    String farmerId = sale['farmerId'];
    String farmerLName = sale['farmerLName'];
    String farmerMuniciplaity = sale['farmerMuniciplaity'];
    String farmerName = sale['farmerName'];
    String farmerUname = sale['farmerUname'];
    String farmerUrl = sale['farmerUrl'];
    bool isDisputed = sale['isDisputed'];
    bool isResolved = sale['isResolved'];
    String listingId = sale['listingId'];
    String listingName = sale['listingName'];
    double listingPrice = (sale['listingPrice'] as num).toDouble();
    double listingQuan = (sale['listingQuan'] as num).toDouble();
    String listingUrl = sale['listingUrl'];
    double purchasePrice = (sale['purchasePrice'] as num).toDouble();
    double purchaseQuantity = (sale['purchaseQuantity'] as num).toDouble();
    double purchaseSwapCoinsPay =
        (sale['purchaseSwapCoinsPay'] as num).toDouble();
    Timestamp transactionDate = sale['transactionDate'];

    /*Converting the time into datetime and datetime string */
    DateTime disputeDateTime = disputeDate.toDate();
    String disputeDateString = DateFormat('dd-MM-yyyy').format(disputeDateTime);

    /*Transaction date*/
    DateTime transactinDateTime = transactionDate.toDate();
    String transactionDateString =
        DateFormat('dd-MM-yyyy').format(transactinDateTime);

    if (disputeStatus == "PENDING") {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 100,
          width: 100,
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
              /*The listing image */
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(listingUrl),
                  radius: 40,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  poppinsText(
                      consumerName, Colors.black, 20, FontWeight.normal),
                  poppinsText(
                      "Reporting User", Colors.black54, 15, FontWeight.normal),
                  poppinsText(
                      disputeDateString, Colors.black54, 15, FontWeight.normal),
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              IconButton(
                onPressed: () {
                  /*Redirecting to the details page */
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ConsumerDisputeSellDetails(
                            consBarangay: conusmerBarangay,
                            consId: consumerId,
                            consLname: consumerLname,
                            consMunicipal: consumerMuniciplaity,
                            consName: consumerName,
                            consUname: consumerUname,
                            consUrl: consumerUrl,
                            disputeDate: disputeDateTime,
                            disputeText: disputeText,
                            disputeStatus: disputeStatus,
                            disputeUrl: disputeUrl,
                            fBarangay: farmerBarangay,
                            fId: farmerId,
                            fLname: farmerLName,
                            fMunicipal: farmerMuniciplaity,
                            fName: farmerName,
                            fUname: farmerUname,
                            fUrl: farmerUrl,
                            isDisputed: isDisputed,
                            isResolved: isResolved,
                            lId: listingId,
                            lName: listingName,
                            lPrice: listingPrice,
                            lQuan: listingQuan,
                            lUrl: listingUrl,
                            pPrice: purchasePrice,
                            pQuan: purchaseQuantity,
                            pSwapC: purchaseSwapCoinsPay,
                            transactDate: transactionDateString);
                      },
                    ),
                  );
                },
                icon: Icon(
                  FontAwesomeIcons.pencil,
                  color: greenNormal,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
