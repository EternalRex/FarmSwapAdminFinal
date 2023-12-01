import 'package:cached_network_image/cached_network_image.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/Colors/farmswap_colors.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_adminaccount_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_commu_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_dashboard_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_dispute_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_listings_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_logout_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_options_header_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_reports_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_transaction_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_useraccout_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_buttons/dispute_wallet_btn.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_text/widget_dispute_search.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/widgets/dispute_text/widget_dispute_txt.dart';
import 'package:flutter/material.dart';

class ConsumerDisputeBarterDetails extends StatefulWidget {
  const ConsumerDisputeBarterDetails({
    super.key,
    /*Getting farmer data */
    required this.farmerName,
    required this.farmerId,
    required this.farmerLname,
    required this.farmerUname,
    required this.farmerBarangay,
    required this.farmerMunicipal,
    /*Getting the consumer Data */
    required this.consumerName,
    required this.consumerId,
    required this.consumerUname,
    required this.consumerLname,
    required this.consumerBarangay,
    required this.consumerMunicipal,
    /*Item details */
    required this.itemName,
    required this.itemValue,
    required this.itemUrl,
    /*This is suppose to be consumerDisputed status the naming was just a mistake*/
    required this.consumerDisputedStatus,
    required this.isResolved,
    required this.consumerDisputeText,
    required this.consumerDisputeUrl,
    /*Listing details */
    required this.listingId,
    required this.listingName,
    required this.listingPrice,
    required this.listingUrl,
    /*Transaction details*/
    required this.deductedFSwapCoins,
    required this.deductedConsumerCoins,
    required this.valueRange,
    required this.percentageFee,

    /*Converting timestamps to datetime and String*/
    required this.transacDateTime,
    required this.transactionDateString,
    required this.disputeDate,
    required this.disputeDateString,
  });

  /*Getting farmer data */
  final String farmerName;
  final String farmerId;
  final String farmerLname;
  final String farmerUname;
  final String farmerBarangay;
  final String farmerMunicipal;
  /*Getting the consumer Data */
  final String consumerName;
  final String consumerId;
  final String consumerUname;
  final String consumerLname;
  final String consumerBarangay;
  final String consumerMunicipal;
  /*Item details */
  final String itemName;
  final double itemValue;
  final String itemUrl;
  /*This is suppose to be consumerDisputed status the naming was just a mistake*/
  final String consumerDisputedStatus;
  final bool isResolved;
  final String consumerDisputeText;
  final String consumerDisputeUrl;
  /*Listing details */
  final String listingId;
  final String listingName;
  final String listingPrice;
  final String listingUrl;
  /*Transaction details*/
  final double deductedFSwapCoins;
  final double deductedConsumerCoins;
  final double valueRange;
  final String percentageFee;

  /*Converting timestamps to datetime and String*/
  final DateTime transacDateTime;
  final String transactionDateString;

  final DateTime disputeDate;
  final String disputeDateString;

  @override
  State<ConsumerDisputeBarterDetails> createState() => _ConsumerDisputeBarterDetailsState();
}

class _ConsumerDisputeBarterDetailsState extends State<ConsumerDisputeBarterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
      body: Row(
        children: [
/*FIRST EXPANDED THAT WILL CONTAIN ALL THE NAVIGATION */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              child: Container(
                /*DECORATING THE CONTAINER */
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: shadow,
                      blurRadius: 2,
                      offset: const Offset(1, 5),
                    ),
                  ],
                ),
                /*A COLUMN THAT WILL HOLD THE NAVIGATIONS OPTIONS */
                child: const Column(
                  children: [
                    /*THE TITLE AND LOGO IN THE PAGE OPTIONS */
                    DisputePageOptionsTitle(),
                    /*30 PXLS SPACE BETWEEN*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL HOLD THE DASHBOARD LOGO AND THE DASHBOARD LABEL */
                    DisputeDashboardOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    DisputeAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    DisputeUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    DisputeListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    DisputeTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    DisputeReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    DisputeDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    DisputeWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 15,
                    ),
                    /*THIS ROW WILL CONTAIN THE COMMUNICATIONS ICON AND LABEL */
                    DisputeCommunicationOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    Spacer(),
                    /*THIS ROW WILL CONTAIN THE lOGOUT ICON AND LABEL */
                    DisputeLogoutOptionBtn(),
                  ],
                ),
              ),
            ),
          ),
/*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
          Expanded(
            flex: 4,
            // ignore: avoid_unnecessary_containers
            child: Container(
              /*SETTING THE BACKGROUND OF THE CENTER OF THE PAGE INTO WHITE */
              child: Padding(
                /*WRAPPING A SCAFFOLD WITH PADDING SO THAT IT WILL HAVE SOME SPACE
                FROM THE BORDERS OF THE OTHER 2 DIVISIONS */
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                /*PUTTING A SCAFFOLD INSIDE THE  CENTER CONTAINER SO THAT WE CAN
                USE THE BODY PROPERTY AND DECLARE SOME COLUMN OR ROWS THAT WILL HAVE
                A CHILDREN PROPERTY WHERE WE CAN PUT A LOT OF WIDGETS HEHEHE */
                child: Scaffold(
                  /*THIS IS AN APPBAR OF THE CENTER DIVISION THAT HAS THE DASHBOARD TITLE AND THE 
                  SEARCH BAR */
                  appBar: AppBar(
                    /*PUTTING AND STYLING THE DASHBOARD TITLE. I USED THE TEXT CLASS THAT I CREATED IN
                  THIS TITLE, THAT CLASS CAN BE FOUND IN WIDGET_DASHBOARD_TXT.DART*/
                    title: const DisputeTitleText(
                      myText: "Barter Dispute Details",
                      myColor: Color(0xFF09041B),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    /*IN THE  APPBAR, WE USED THE ACTIONS PROPERTY SO THAT WE CAN PUT
                    A LOT OF WIDGETS IN THE APPBAR, IN HERE IT IS USED SO THAT WE CAN PUT 
                    A TEXT FIELD WIDGET FOR SEARCHING*/
                    actions: const [
                      /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                    HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
                      Padding(
                        padding: EdgeInsets.all(10),
                        /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                        HEIGH AND WIDTH OF THE TEXT FIELD */
                        child: SizedBox(
                          width: 250,
                          height: 15,
                          /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                          IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
                          child: DisputeSearchBar(),
                        ),
                      ),
                    ],
                  ),
/*START OF THE SECOND EXPANDEDS BODY */
                  body: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          //Decorate the expanded area for the main content
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                          child: Container(
                            //Design of the container
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),

                              //Box shadow of container
                              boxShadow: [
                                BoxShadow(
                                  color: shadow,
                                  blurRadius: 2,
                                  offset: const Offset(1, 5),
                                ),
                              ],
                            ),

                            //Column for main content
                            child: SingleChildScrollView(
                              /*Mao ni screen na mag ilis ilis depended sa value sa variable */
                              child: Column(
                                children: [
                                  Center(
                                    child: Row(
                                      children: [
                                        /*This container is for the farmer and listing details */
                                        Container(
                                          height: 280,
                                          width: 480,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          /*Column that will hold the details of this row vertically */
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                /*Row of the image and its discription*/
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    /*Container of the image */
                                                    Container(
                                                      width: 190,
                                                      height: 190,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: CachedNetworkImageProvider(
                                                              widget.listingUrl),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        poppinsText2(
                                                          "Listing Name: ${widget.listingName}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                        poppinsText2(
                                                          "Equivalent Value: ${widget.listingPrice}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                        poppinsText(
                                                          "Farmer: ${widget.farmerUname}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          width: 1,
                                          decoration: const BoxDecoration(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        /*This container is for the item  details and consumer */
                                        Container(
                                          height: 280,
                                          width: 480,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          /*Column that will hold the details of this row vertically */
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                /*Row of the image and its discription*/
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    /*Container of the image */
                                                    Container(
                                                      width: 190,
                                                      height: 190,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(widget.itemUrl),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        poppinsText2(
                                                          "Listing Name: ${widget.itemName}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                        poppinsText2(
                                                          "Equivalent Value: ${widget.itemValue}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                        poppinsText(
                                                          "Consumer: ${widget.consumerName}",
                                                          Colors.black,
                                                          17,
                                                          FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*Container na magunit sa transaction */
                                  Container(
                                    height: 300,
                                    width: 1000,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: poppinsText(
                                            "Transaction Details",
                                            Colors.black,
                                            20,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        /*Row for transaction value */
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Transaction Value",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  widget.valueRange.toString(),
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*For transaction percentage Fee */
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Percentage Fee",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  widget.percentageFee.toString(),
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*Farmer Deducted Swap Coins*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Farmer SwapCoins Deduction",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  widget.deductedFSwapCoins.toString(),
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*Consumer deducted swap coins */
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Consumer SwapCoins Deduction",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  widget.deductedConsumerCoins.toString(),
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Transaction Date",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  widget.transactionDateString,
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*Container na mugunit sa gi report na details */
                                  Container(
                                    height: 300,
                                    width: 1000,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: poppinsText(
                                            "Reported User Details",
                                            Colors.black,
                                            20,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        /*Row for farmername*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Farmer Name",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "${widget.farmerName} ${widget.farmerLname} (${widget.farmerUname})",
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*Farmer Barangay Location*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Baranggay",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Baranggay ${widget.farmerBarangay}",
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*Farmer Municipality*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Farmer Municipality",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Muncipality of ${widget.farmerMunicipal}",
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  /*For the  actual report Details */
                                  Container(
                                    height: 700,
                                    width: 1000,
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: poppinsText(
                                            "Report Details",
                                            Colors.black,
                                            20,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        /*Row for report content*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "Report Content",
                                                  FarmSwapGreen.darkGreen,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                                child: poppinsText(
                                                    ":", Colors.black, 20, FontWeight.normal),
                                              ),
                                              SizedBox(
                                                child: poppinsText2(
                                                  "${widget.consumerDisputeText}",
                                                  Colors.black,
                                                  20,
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /*Row for the dispute picture proof*/
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 500,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  image: DecorationImage(
                                                      image:
                                                          NetworkImage(widget.consumerDisputeUrl)),
                                                ),
                                              ),
                                              poppinsText("Photo Proof", Colors.black54, 20,
                                                  FontWeight.w500),
                                            ],
                                          ),
                                        ),
                                      ],
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
