import 'dart:math';

import './model/transaction.dart';

import './widget/inputs_fields.dart';

import './widget/top_bottom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'EduTASBeginner',
      ),
      title: 'My App',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [];

  void _addTransaction(String txTitle, double txAmount, DateTime date) {
    var id = Random().nextInt(100000);

    var newTx =
        Transaction(id: id, amount: txAmount, date: date, title: txTitle);
    setState(() {
      print(id);
      transactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: (() {}),
            child: InputsFields(_addTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deleteMe(var id) {
    setState(() {
      transactions.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
        title: const Text('Expenses App'),
      ),
      body: MainPageContent(transactions: transactions, del: deleteMe),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
