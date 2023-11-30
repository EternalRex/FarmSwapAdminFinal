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
  late double activeUsers = 0.0;

  //store the percentage of archived users
  late double archivedUsers = 0.0;

  //used to perform initialization tasks, such as fetching data
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final CollectionReference farmerActive =
        FirebaseFirestore.instance.collection('sample_FarmerUsers');
    final CollectionReference consumerActive =
        FirebaseFirestore.instance.collection('sample_ConsumerUsers');
    final CollectionReference farmerArchived =
        FirebaseFirestore.instance.collection('sample_FarmerArchived');
    final CollectionReference consumerArchived =
        FirebaseFirestore.instance.collection('sample_ConsumerArchived');

    QuerySnapshot activeFarmerSnapshot =
        await farmerActive.where('accountStatus', isEqualTo: 'Active').get();
    QuerySnapshot activeConsumerSnapshot =
        await consumerActive.where('accountStatus', isEqualTo: 'ACTIVE').get();
    QuerySnapshot archivedFarmerSnapshot = await farmerArchived
        .where('accountStatus', isEqualTo: 'Archived')
        .get();
    QuerySnapshot archivedConsumerSnapshot = await consumerArchived
        .where('accountStatus', isEqualTo: 'ARCHIVED')
        .get();

    final totalActiveUsers =
        (activeFarmerSnapshot.size + activeConsumerSnapshot.size);
    final totalArchivedUsers =
        (archivedFarmerSnapshot.size + archivedConsumerSnapshot.size);

    setState(() {
      activeUsers =
          (totalActiveUsers / (totalActiveUsers + totalArchivedUsers)) * 100;
      archivedUsers =
          (totalArchivedUsers / (totalActiveUsers + totalArchivedUsers)) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 380,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 10,
              borderData: FlBorderData(show: false),
              sectionsSpace: 5,
              sections: _generateSections(),
            ),
          ),
        ),
        //for active users
        SizedBox(
          height: 50,
          width: 380,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator(
                color: greenNormal,
                textColor: const Color(0xFF09051B),
                text: 'Active Users',
                isSquare: true,
              ),
              const SizedBox(
                width: 30,
              ),
              //for active users
              Indicator(
                color: greenLightActive,
                textColor: const Color(0xFF09051B),
                text: 'Archived Users',
                isSquare: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _generateSections() {
    return List.generate(
      2,
      (i) {
        const radius = 80.0;
        final shadows = [Shadow(color: shadow, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: greenNormal,
              value: activeUsers,
              title: '${activeUsers.toStringAsFixed(2)}%',
              radius: radius,
              titleStyle: Poppins.farmerName.copyWith(
                color: Colors.white,
                shadows: shadows,
              ),
            );
          case 1:
            return PieChartSectionData(
              color: greenLightActive,
              value: archivedUsers,
              title: '${archivedUsers.toStringAsFixed(2)}%',
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
}
