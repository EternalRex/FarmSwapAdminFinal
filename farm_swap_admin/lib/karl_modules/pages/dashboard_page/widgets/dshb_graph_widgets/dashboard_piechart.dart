import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:farm_swap_admin/constants/typography/typography.dart';
import 'package:farm_swap_admin/karl_modules/pages/dashboard_page/data/testData/DashboardPieGraph/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UsersPieChart extends StatefulWidget {
  const UsersPieChart({super.key});

  @override
  State<UsersPieChart> createState() => _UsersPieChartState();
}

class _UsersPieChartState extends State<UsersPieChart> {
  //store the percentage of active users
  late int activeUsers = 0;

  //store the percentage of archived users
  late int archivedUsers = 0;

  //store the percentage of requesting users
  late int requestUsers = 0;

  //store the percentage of ar users
  late int arUsers = 0;

  //store the percentage of deact users
  late int deactUsers = 0;

  //used to perform initialization tasks, such as fetching data
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    //active
    final CollectionReference farmerActive =
        FirebaseFirestore.instance.collection('sample_FarmerUsers');
    final CollectionReference consumerActive =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    //archived
    final CollectionReference farmerArchived =
        FirebaseFirestore.instance.collection('sample_FarmerArchived');
    final CollectionReference consumerArchived =
        FirebaseFirestore.instance.collection('sample_ConsumerArchived');
    //request
    final CollectionReference farmerRequest =
        FirebaseFirestore.instance.collection('sample_FarmerUsers');
    final CollectionReference consumerRequest =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    //deactivate
    final CollectionReference farmerDeact =
        FirebaseFirestore.instance.collection('sample_FarmerUsers');
    final CollectionReference consumerDeact =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');

    //acrive
    QuerySnapshot activeFarmerSnapshot = await farmerActive.where(
        'accountStatus',
        whereIn: ['Active', 'ACTIVE']).get();
    QuerySnapshot activeConsumerSnapshot = await consumerActive
        .where('accountStatus', whereIn: ['ACTIVE']).get();
    //archived
    QuerySnapshot archivedFarmerSnapshot = await farmerArchived
        .where('accountStatus', isEqualTo: 'Archived')
        .get();
    QuerySnapshot archivedConsumerSnapshot = await consumerArchived
        .where('accountStatus', isEqualTo: 'ARCHIVED')
        .get();
    //request
    QuerySnapshot requestingFarmerSnapshot = await farmerRequest
        .where('accountStatus', isEqualTo: 'Requesting')
        .get();
    QuerySnapshot requestingConsumerSnapshot = await consumerRequest
        .where('accountStatus', isEqualTo: 'REQUESTING')
        .get();
    //deactivate
    QuerySnapshot deactFarmerSnapshot = await farmerDeact
        .where('accountStatus', isEqualTo: 'Deactivated')
        .get();
    QuerySnapshot deactConsumerSnapshot = await consumerDeact
        .where('accountStatus', isEqualTo: 'DEACTIVATED')
        .get();

    final totalARUsers =
        (activeFarmerSnapshot.size + activeConsumerSnapshot.size + requestingFarmerSnapshot.size + requestingConsumerSnapshot.size);
    final totalActiveUsers =
        (activeFarmerSnapshot.size + activeConsumerSnapshot.size);
    final totalArchivedUsers =
        (archivedFarmerSnapshot.size + archivedConsumerSnapshot.size);
    final totalRequestingUsers =
        (requestingFarmerSnapshot.size + requestingConsumerSnapshot.size);
    final totalDeactUsers = (deactFarmerSnapshot.size + deactConsumerSnapshot.size);

    setState(() {
      arUsers = totalARUsers;
      activeUsers = totalActiveUsers;
      archivedUsers = totalArchivedUsers;
      requestUsers = totalRequestingUsers;
      deactUsers = totalDeactUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 250,
          width: 215,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 10,
              borderData: FlBorderData(show: false),
              sectionsSpace: 3,
              sections: _generateSections(),
            ),
          ),
        ),
        //for active users
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              showUserDetailsDialog(
                  'Users', activeUsers, archivedUsers, requestUsers, deactUsers);
            },
            child: SizedBox(
              height: 250,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Indicator(
                    color: greenNormal,
                    textColor: const Color(0xFF09051B),
                    text: 'Active Users',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //for active users
                  Indicator(
                    color: greenLightActive,
                    textColor: const Color(0xFF09051B),
                    text: 'Archived Users',
                    isSquare: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Indicator(
                    color: greenLightHover,
                    textColor: const Color(0xFF09051B),
                    text: 'Deactivated Users',
                    isSquare: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _generateSections() {
    return List.generate(
      3,
      (i) {
        const radius = 80.0;
        final shadows = [Shadow(color: shadow, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: greenNormal,
              value: arUsers.toDouble(),
              title: arUsers.toString(),
              radius: radius,
              titleStyle: Poppins.farmerName.copyWith(
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: greenLightActive,
              value: archivedUsers.toDouble(),
              title: archivedUsers.toString(),
              radius: radius,
              titleStyle: Poppins.farmerName.copyWith(
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 2:
            return PieChartSectionData(
              color: greenLightHover,
              value: deactUsers.toDouble(),
              title: deactUsers.toString(),
              radius: radius,
              titleStyle: Poppins.farmerName.copyWith(
                color: Colors.white,
                shadows: shadows,
              ),
            );
          default:
            throw Exception("Default error message");
        }
      },
    );
  }

  void showUserDetailsDialog(
      String userType, int activeUsers, int archivedUsers, int requestUsers, int deactUsers){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Details'),
          content: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Active $userType: $activeUsers'),
                Text('Total Requesting $userType: $requestUsers'),
                Text('Total Deactivated $userType: $deactUsers'),
                Text('Total Archived $userType: $archivedUsers'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                elevation: const MaterialStatePropertyAll(0),
              ),
              child: Text(
                'Close',
                style: Poppins.farmerName.copyWith(
                  color: greenNormal,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
