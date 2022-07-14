import 'dart:math';

import 'package:expenses_app_flutter/widget/chart_widget.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import 'package:flutter/material.dart';

class ChartInformation extends StatelessWidget {
  final List<Transaction> recentTransactions;
  ChartInformation(this.recentTransactions);
  List<Map<String, Object>> get listData {
    return List.generate(7, (index) {
      final datetime_inofs = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (datetime_inofs.day == recentTransactions[i].date.day &&
            datetime_inofs.month == recentTransactions[i].date.month &&
            datetime_inofs.year == recentTransactions[i].date.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(datetime_inofs).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return recentTransactions.fold(0.0, (previousValue, element) {
      return previousValue + element.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(listData);
    return Container(
      width: double.infinity,
      height: 250,
      child: totalSpending == 0.0
          ? Center(
              child: Text("No Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          : MyCharts(listData),
    );
  }
}
