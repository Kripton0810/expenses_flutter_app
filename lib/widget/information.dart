import 'package:expenses_app_flutter/widget/right_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './price.dart';

class Information extends StatelessWidget {
  String title;
  DateTime date;
  double amount;
  int id;
  final Function deleteme;
  Information(
      {required this.amount,
      required this.date,
      required this.title,
      required this.deleteme,
      required this.id
      });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Container(
          padding: const EdgeInsets.all(2.0),
          child: FittedBox(
            child: Text(
              "₹${amount.toString()}",
            ),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(DateFormat.yMMMd().format(date)),
      trailing: IconButton(
        onPressed: () {
          deleteme(id);
        },
        icon: Icon(
          Icons.delete,
          color: Color.fromARGB(255, 240, 73, 73),
        ),
      ),
    );
    // return Container(
    //   padding: const EdgeInsets.all(12),
    //   child: Row(
    //     children: [Price(amount), RightContainer(date: date, title: title)],
    //   ),
    // );
  }
}
