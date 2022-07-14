import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final double price;
  Price(this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColorDark,
              style: BorderStyle.solid)),
      child: Text(
        "₹ ${price.toStringAsFixed(2)}",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
