import 'package:expenses_app_flutter/model/transaction.dart';
import 'package:expenses_app_flutter/widget/chart_info.dart';
import 'package:expenses_app_flutter/widget/expencess.list.dart';
import 'package:flutter/material.dart';

class MainPageContent extends StatefulWidget {
  final List<Transaction> transactions;
  Function del;

  MainPageContent({required this.transactions, required this.del});

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChartInformation(widget.transactions),
          ExpencessList(
            widget.transactions,
            widget.del
          ),
        ],
      ),
    );
  }
}
