import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyCharts extends StatelessWidget {
  List<Map<String, Object>> map;
  MyCharts(this.map);
  @override
  Widget build(BuildContext context) {
    double i = 0;
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: [
              ...map.map((e) {
                i++;
                return FlSpot(i, e['amount'] as double);
              })
            ],
          )
        ],
      ),
    );
  }
}
