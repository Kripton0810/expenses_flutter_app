import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RightContainer extends StatelessWidget {
  String title;
  DateTime date;
  RightContainer({required this.date, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(DateFormat.yMMMd().format(date))
        ],
      ),
    );
  }
}
