import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/poppins_text.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/resolved%20dispute/consumer/get_consumer_admin_barter_resol.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/resolved%20dispute/consumer/get_consumer_admin_sell_resol.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/resolved%20dispute/get_farmer_admin_barter_resol.dart';
import 'package:farm_swap_admin/karl_modules/pages/dispute_page/screens/resolved%20dispute/get_farmer_admin_sell_resol.dart';
import 'package:flutter/material.dart';

class GetAdminFarmerSaleResolutions extends StatefulWidget {
  const GetAdminFarmerSaleResolutions({super.key});

  @override
  State<GetAdminFarmerSaleResolutions> createState() => _GetAdminFarmerSaleResolutionsState();
}

class _GetAdminFarmerSaleResolutionsState extends State<GetAdminFarmerSaleResolutions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            /*This is the row for the consumer barter dispute */
            Row(
              children: [
                Column(
                  children: [
                    /*Just the title that says Barter Disputes */
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: 378,
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
                        child: Center(
                            child: poppinsText(
                                "Farmer Barter Resolutions", Colors.black, 15, FontWeight.bold)),
                      ),
                    ),
                    /*The container that carries the data */
                    SingleChildScrollView(
                      child: Container(
                        width: 395,
                        height: 600,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const GetFarmerAdminBarterResol(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 3,
            ),
            /*This is the row for the consumer sell dispute */
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Container(
                        height: 50,
                        width: 378,
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
                        child: Center(
                            child: poppinsText(
                                "Farmer Sell Resolutions", Colors.black, 15, FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: 395,
                      height: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const GetFarmerAdmiSellingResol(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        /*Row for consumer Resolutions */
        Row(
          children: [
            /*This is the row for the consumer barter dispute */
            Row(
              children: [
                Column(
                  children: [
                    /*Just the title that says Barter Disputes */
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: 378,
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
                        child: Center(
                            child: poppinsText(
                                "Consumer Barter Resolutions", Colors.black, 15, FontWeight.bold)),
                      ),
                    ),
                    /*The container that carries the data */
                    SingleChildScrollView(
                      child: Container(
                        width: 395,
                        height: 600,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: const GetConsumerAdminBarterResol(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 3,
            ),
            /*This is the row for the consumer sell dispute */
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Container(
                        height: 50,
                        width: 378,
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
                        child: Center(
                            child: poppinsText(
                                "Consumer Sale Resolutions", Colors.black, 15, FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: 395,
                      height: 600,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const GetConsumerAdminSellResol(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/*
SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: Container(
                height: 375.h,
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
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Barter Resolutions',
                        style: Poppins.farmerName.copyWith(
                          color: greenDark,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 320.h,
                        width: MediaQuery.of(context).size.width,
                        child: const GetFarmerBarterResolution(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: Container(
                height: 375.h,
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
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Sale Resolutions',
                        style: Poppins.farmerName.copyWith(
                          color: greenDark,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 320.h,
                        width: MediaQuery.of(context).size.width,
                        child: const GetFarmerSellingResolution(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*For the penalties received*/
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: Container(
                height: 375.h,
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
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Barter Penalties',
                        style: Poppins.farmerName.copyWith(
                          color: greenDark,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 320.h,
                        width: MediaQuery.of(context).size.width,
                        child: const GetFBarterPenalties(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: Container(
                height: 375.h,
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
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Sell Penalties',
                        style: Poppins.farmerName.copyWith(
                          color: greenDark,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 320.h,
                        width: MediaQuery.of(context).size.width,
                        child: const GetFSellPenalties(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
 */