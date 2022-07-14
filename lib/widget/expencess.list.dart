import 'dart:ui';

import 'package:expenses_app_flutter/model/transaction.dart';
import 'package:flutter/material.dart';
import './information.dart';

class ExpencessList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteme;
  ExpencessList(this.transactions, this.deleteme);

  @override
  Widget build(BuildContext context) {
    return transactions.length <= 0
        ? Column(
            children: [
              Text(
                "No Transaction made yet",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset('assets/images/waiting.png'))
            ],
          )
        : Container(
            height: 440,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: Information(
                  amount: transactions[index].amount,
                  date: transactions[index].date,
                  title: transactions[index].title,
                  deleteme: deleteme,
                  id: transactions[index].id,
                ));
              },
              itemCount: transactions.length,
            ),
          );
  }
}
