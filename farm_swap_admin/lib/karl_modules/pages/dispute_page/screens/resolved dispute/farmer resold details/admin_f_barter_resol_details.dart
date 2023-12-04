import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminFarmerBarterResolDetails extends StatefulWidget {
  const AdminFarmerBarterResolDetails({
    super.key,
    required this.itemUrl,
    required this.listingUrl,
    required this.adminEmail,
    required this.consumerid,
    required this.farmerid,
    required this.penaltyMessage,
    required this.resolDate,
    required this.resolDateString,
    required this.resolutionMessage,
    required this.reported,
    required this.reporting,
    required this.reportedRole,
    required this.reportingRole,
  });

  final String itemUrl;
  final String listingUrl;
  final String adminEmail;
  final String consumerid;
  final String farmerid;
  final String penaltyMessage;
  final DateTime resolDate;
  final String resolDateString;
  final String resolutionMessage;
  final String reported;
  final String reporting;
  final String reportedRole;
  final String reportingRole;

  @override
  State<AdminFarmerBarterResolDetails> createState() => _AdminFarmerBarterResolDetailsState();
}

class _AdminFarmerBarterResolDetailsState extends State<AdminFarmerBarterResolDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*For the resolution message */
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: poppinsText2(widget.resolutionMessage, Colors.black, 15, FontWeight.normal),
              ),
              const Divider(
                thickness: 2,
              ),
              poppinsText("Resolution Message", Colors.black54, 15, FontWeight.normal),
              /*For the penalty */
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 300,
                child: poppinsText2(widget.penaltyMessage, Colors.black, 15, FontWeight.normal),
              ),
              const Divider(
                thickness: 2,
              ),
              poppinsText("Penalty", Colors.black54, 15, FontWeight.normal),
              /*Offending user */
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: poppinsText2('${widget.reported} (${widget.reportedRole})', Colors.black, 15,
                    FontWeight.normal),
              ),
              const Divider(
                thickness: 2,
              ),
              poppinsText("Reported User", Colors.black54, 15, FontWeight.normal),
              /*Admin resolutioner */
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 300,
                child: poppinsText2(
                    '${widget.adminEmail} (ADMIN)', Colors.black, 15, FontWeight.normal),
              ),
              const Divider(
                thickness: 2,
              ),
              poppinsText("Issued By", Colors.black54, 15, FontWeight.normal),
              /*Resolution Date */
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: poppinsText2(widget.resolDateString, Colors.black, 15, FontWeight.normal),
              ),
              const Divider(
                thickness: 2,
              ),
              poppinsText("Date Issued", Colors.black54, 15, FontWeight.normal),
            ],
          ),
        ),
      ),
    );
  }
}
