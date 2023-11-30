import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SellTransChart extends StatefulWidget {
  const SellTransChart({super.key});

  @override
  State<SellTransChart> createState() => _SellTransChartState();
}

class _SellTransChartState extends State<SellTransChart> {
  late List<double> monthlyTotals;
  late double maxTotal;
  int selectedYear = DateTime.now().year; // Default to the current year

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final CollectionReference transactions =
        FirebaseFirestore.instance.collection('sample_SellingTransactions');

    // Initialize monthlyTotals with zeros for each month
    monthlyTotals = List.generate(12, (index) => 0.0);

    QuerySnapshot transactionSnapshot = await transactions.get();

    transactionSnapshot.docs.forEach((transaction) {
      // Extract the transactionDate field (assuming it's in DateTime format)
      DateTime? transactionDate =
          (transaction['transactionDate'] as Timestamp?)?.toDate();

      if (transactionDate != null && transactionDate.year == selectedYear) {
        // Update the monthlyTotals based on the month of the transaction
        int monthIndex = transactionDate.month - 1; // Month indices are 0-based
        monthlyTotals[monthIndex] += 1; // Increment by 1 for each transaction
      }
    });
    // Find the maximum value in monthlyTotals for left axis labels
    maxTotal = monthlyTotals
        .reduce((value, element) => value > element ? value : element);
    setState(() {}); // Trigger a rebuild to update the chart
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Select Year: ',
                style: TextStyle(fontSize: 12),
              ),
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(
                  3, // You can customize the range of years displayed in the dropdown
                  (index) => DropdownMenuItem<int>(
                    value: DateTime.now().year - index,
                    child: Text((DateTime.now().year + index).toString()),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value!;
                    fetchData();
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 200,
            width: 370,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: monthlyTotals
                        .reduce((max, value) => max > value ? max : value) +
                    5,
                titlesData: barTitlesData,
                borderData: barBordersData,
                barTouchData: barTouchedData,
                barGroups: List.generate(
                  monthlyTotals.length,
                  (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: monthlyTotals[index],
                        color: greenNormal,
                        width: 16,
                        borderRadius: const BorderRadius.all(Radius.zero),
                      ),
                    ],
                    showingTooltipIndicators: [0],
                  ),
                ),
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarTouchData get barTouchedData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (BarChartGroupData group, int groupIndex,
              BarChartRodData rod, int rodIndex) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(
                color: Color.fromARGB(255, 0, 212, 162),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = "Jan";
        break;

      case 1:
        text = "Feb";
        break;

      case 2:
        text = "Mar";
        break;

      case 3:
        text = "Apr";
        break;

      case 4:
        text = "May";
        break;

      case 5:
        text = "Jun";
        break;

      case 6:
        text = "Jul";
        break;

      case 7:
        text = "Aug";
        break;

      case 8:
        text = "Sep";
        break;

      case 9:
        text = "Oct";
        break;

      case 10:
        text = "Nov";
        break;

      case 11:
        text = "Dec";
        break;

      default:
        text = "";
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  FlTitlesData get barTitlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 15,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 20,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );

  FlBorderData get barBordersData => FlBorderData(
        show: false,
      );
}
