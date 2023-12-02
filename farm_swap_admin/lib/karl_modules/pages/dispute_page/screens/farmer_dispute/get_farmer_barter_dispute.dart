import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/farmer_dispute/farmer_dispute_barter_details.dart';
import 'package:farm_swap_admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GetFarmerBarterDispute extends StatefulWidget {
  const GetFarmerBarterDispute({super.key});

  @override
  State<GetFarmerBarterDispute> createState() => _GetFarmerBarterDisputeState();
}

class _GetFarmerBarterDisputeState extends State<GetFarmerBarterDispute> {
  final _firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebase
          .collectionGroup('fBarterDispute')
          .orderBy('disputeDateFile', descending: true)
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
    Map<String, dynamic> barter = document.data() as Map<String, dynamic>;

    /*Getting farmer data */
    String farmerName = barter['farmerName'];
    String farmerId = barter['farmerId'];
    String farmerLname = barter['farmerLname'];
    String farmerUname = barter['farmerUname'];
    String farmerBarangay = barter['farmerBarangay'];
    String farmerMunicipal = barter['farmerMunicipality'];
    /*Getting the consumer Data */
    String consumerName = barter['consumerName'];
    String consumerId = barter['consumerId'];
    String consumerUname = barter['consumerUname'];
    String consumerLname = barter['consumerLname'];
    String consumerBarangay = barter['consumerBarangay'];
    String consumerMunicipal = barter['consumerMunicipality'];
    /*Item details */
    String itemName = barter['itemName'];
    double itemValue = (barter['itemValue'] as num).toDouble();
    String itemUrl = barter['itemUrl'];
    /*This is suppose to be consumerDisputed status the naming was just a mistake*/
    String farmerDisputedStatus = barter['farmerDisputeStatus'];
    bool isResolved = barter['isResolved'];
    Timestamp disputeFiledDate = barter['disputeDateFile'];
    String farmerDisputeText = barter['farmerDisputeText'];
    String farmerDisputeUrl = barter['farmerDisputeUrl'];
    /*Listing details */
    String listingId = barter['listingId'];
    String listingName = barter['listingName'];
    String listingPrice = barter['listingPrice'];
    String listingUrl = barter['listingUrl'];
    /*Transaction details*/
    double deductedFSwapCoins =
        (barter['deductedFarmerCoins'] as num).toDouble();
    double deductedConsumerCoins =
        (barter['deductedConsumerCoins'] as num).toDouble();
    double valueRange = (barter['valueRange'] as num).toDouble();
    String percentageFee = barter['percentageFee'];
    Timestamp transactionDate = barter['transactionDate'];

    /*Converting timestamps to datetime and String*/
    DateTime transacDateTime = transactionDate.toDate();
    String transactionDateString =
        DateFormat('dd-MM-yyyy').format(transacDateTime);

    DateTime disputeDate = disputeFiledDate.toDate();
    String disputeDateString = DateFormat('dd-MM-yyyy').format(disputeDate);

    if (farmerDisputedStatus == "PENDING") {
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
                  poppinsText(farmerName, Colors.black, 20, FontWeight.normal),
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FarmerDisputeBarterDetails(
                        farmerName: farmerName,
                        farmerId: farmerId,
                        farmerLname: farmerLname,
                        farmerUname: farmerUname,
                        farmerBarangay: farmerBarangay,
                        farmerMunicipal: farmerMunicipal,
                        consumerName: consumerName,
                        consumerId: consumerId,
                        consumerUname: consumerUname,
                        consumerLname: consumerLname,
                        consumerBarangay: consumerBarangay,
                        consumerMunicipal: consumerMunicipal,
                        itemName: itemName,
                        itemValue: itemValue,
                        itemUrl: itemUrl,
                        farmerDisputedStatus: farmerDisputedStatus,
                        isResolved: isResolved,
                        farmerDisputeText: farmerDisputeText,
                        farmerDisputeUrl: farmerDisputeUrl,
                        listingId: listingId,
                        listingName: listingName,
                        listingPrice: listingPrice,
                        listingUrl: listingUrl,
                        deductedFSwapCoins: deductedFSwapCoins,
                        deductedConsumerCoins: deductedConsumerCoins,
                        valueRange: valueRange,
                        percentageFee: percentageFee,
                        transacDateTime: transacDateTime,
                        transactionDateString: transactionDateString,
                        disputeDate: disputeDate,
                        disputeDateString: disputeDateString),
                  ));
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
