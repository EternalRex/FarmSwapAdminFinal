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
  int touchedIndex = -1;
  late double activeUsers = 0.0;
  late double archivedUsers = 0.0;

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
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              centerSpaceRadius: 10,
              borderData: FlBorderData(show: false),
              sectionsSpace: 5,
              sections: _generateSections(),
            ),
          ),
        ),
        //for active users
        const SizedBox(
          height: 50,
          width: 380,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator(
                color: Color(0xFF76BA1B),
                textColor: Color(0xFF09051B),
                text: 'Active Users',
                isSquare: true,
              ),
              SizedBox(
                width: 30,
              ),
              //for active users
              Indicator(
                color: Color(0xFF4C9C2A),
                textColor: Color(0xFF09051B),
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
        final isTouched = i == touchedIndex;
        final radius = isTouched ? 90.0 : 80.0;
        final shadows = [Shadow(color: shadow, blurRadius: 2)];
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xFF76BA1B),
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
              color: const Color(0xFF4C9A2A),
              value: archivedUsers,
              title: '${archivedUsers.toStringAsFixed(2)}%',
              radius: radius,
              titleStyle: Poppins.farmerName.copyWith(
                color: Colors.white,
                shadows: shadows,
              ),
            );
          default:
            throw Error();
        }
      },
    );
  }
}
