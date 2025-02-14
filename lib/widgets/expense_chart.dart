import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatelessWidget {
  final Map<String, double> data;

  ExpenseChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> sections = data.entries.map((entry) {
      return PieChartSectionData(
        title: entry.key,
        value: entry.value,
        color: Colors.primaries[data.keys.toList().indexOf(entry.key) % Colors.primaries.length],
        radius: 80,
        titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      );
    }).toList();

    return Container(
      height: 250,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2)],
      ),
      child: PieChart(PieChartData(
        sections: sections,
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      )),
    );
  }
}
