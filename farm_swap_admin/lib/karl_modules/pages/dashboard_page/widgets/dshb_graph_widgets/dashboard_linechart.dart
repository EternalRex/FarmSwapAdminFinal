import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/constants/Colors/colors_rollaine.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RevenueLineChart extends StatefulWidget {
  const RevenueLineChart({super.key});

  @override
  State<RevenueLineChart> createState() => _RevenueLineChartState();
}

class _RevenueLineChartState extends State<RevenueLineChart> {

  late List<double> monthlyTotals;
  int selectedYear = DateTime.now().year; // Default to the current year

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final CollectionReference swapCoinsLogs =
        FirebaseFirestore.instance.collection('sample_SwapCoinsLogs');

    // Initialize monthlyTotals with zeros for each month
    monthlyTotals = List.generate(12, (index) => 0.0);

    QuerySnapshot swapCoinsSnapshot =
        await swapCoinsLogs.where('status', isEqualTo: 'COMPLETED').get();

    swapCoinsSnapshot.docs.forEach((log) {
      // Extract the dateTime field (assuming it's in DateTime format)
      DateTime? logDate = (log['dateTime'] as Timestamp?)?.toDate();

      if (logDate != null && logDate.year == selectedYear) {
        // Update the monthlyTotals based on the month of the log and selected year
        int monthIndex = logDate.month - 1; // Month indices are 0-based
        monthlyTotals[monthIndex] +=
            (log['swapcoins'] ?? 0); // Accumulate swapcoins
      }
    });

    setState(() {}); // Trigger a rebuild to update the chart
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Select Year: ',
              style: TextStyle(fontSize: 16),
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
          width: 365,
          child: LineChart(
            LineChartData(
              titlesData: titlesData,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    monthlyTotals.length,
                    (index) => FlSpot(index.toDouble(), monthlyTotals[index]),
                  ),
                  isCurved: true,
                  color: greenNormal,
                  belowBarData: BarAreaData(
                    show: false,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 0, 255, 174),
                        Color.fromARGB(255, 0, 255, 115),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        /*SINCE WE ARE GOING TO PUT CUSTOMIZE LABELS IN THE BOTTOM WE WILL CREATE
      A SEPRATE METHOD THAT WILL RETURN A SIDETITLES WIDGET BECAUSE BOTTOMTITLES IS 
      ASSIGNED TO A SIDETITLE PROPERTY */
        bottomTitles: AxisTitles(sideTitles: bottomTitles),
        /*SINCE WE ARE GOING TO PUT CUSTOMIZE LABELS IN THE LEFT SIDE WE WILL CREATE A
      SEPARATE METHOD THAT WILL RETURN A SIDETITLE WIDGET SIMILAR TO BOTTOMTITLES */
        leftTitles: AxisTitles(sideTitles: lefTitles),
        /*WE ARE NOT GOING TO PUT ANY LABLELS IN TOP SIDE */
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        /*WE ARE NOT GOING TO PUT ANY LABELS IN RIGHT SIDE */
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );
  SideTitles get bottomTitles => SideTitles(
        getTitlesWidget: bottomTitlesWidget,
        interval: 1,
        reservedSize: 30,
        showTitles: true,
      );

  SideTitles get lefTitles => const SideTitles(
        interval: 1000,
        reservedSize: 40,
        showTitles: true,
      );

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    /*CREATING A DEFAULT TEXT STYLE TO BE USED IN THE SWITCH STATEMENT */
    var style = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.poppins().fontFamily,
      color: Colors.black45,
    );
    /*CREATING A WIDGET VARIABLE TO BE RETURNED SINCE THE FUNCTION
  NEEDS A WIDGET */
    Widget text;
    /*SWITCHING THE VALUES OF THE INDEX, BUT IT MUST BE FIRST CONVERTED
  INTO AN INTEGER */
    switch (value.toInt()) {
      case 0:
        text = Text(
          "Jan",
          style: style,
        );
        break;

      case 1:
        text = Text(
          "Feb",
          style: style,
        );
        break;

      case 2:
        text = Text(
          "Mar",
          style: style,
        );
        break;

      case 3:
        text = Text(
          "Apr",
          style: style,
        );
        break;

      case 4:
        text = Text(
          "May",
          style: style,
        );
        break;

      case 5:
        text = Text(
          "Jun",
          style: style,
        );
        break;

      case 6:
        text = Text(
          "July",
          style: style,
        );
        break;

      case 7:
        text = Text(
          "Aug",
          style: style,
        );
        break;

      case 8:
        text = Text(
          "Sep",
          style: style,
        );
        break;

      case 9:
        text = Text(
          "Oct",
          style: style,
        );
        break;

      case 10:
        text = Text(
          "Nov",
          style: style,
        );
        break;

      case 11:
        text = Text(
          "Dec",
          style: style,
        );
        break;

      default:
        text = const Text("");
        break;
    }
    /*RETURNING A SIDETITLE WIDGET CONTAINING THE LOCATION WHERE
  THE TITLE IS TO BE PUT, THE SPACE BETWEEN TITLES AND THE 
  RESULTING TEXT BASED ON THE SWITCH STATEMENT ABOVE */
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  FlBorderData get bordersData => FlBorderData(
        border: const Border(
          top: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.black),
        ),
      );

  FlGridData get gridsData => const FlGridData(
        show: false,
      );
}
