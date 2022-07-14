import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputsFields extends StatefulWidget {
  final Function addTxFx;
  InputsFields(this.addTxFx);

  @override
  _InputsFieldsState createState() => _InputsFieldsState();
}

class _InputsFieldsState extends State<InputsFields> {
  final title = TextEditingController();
  final amount = TextEditingController();
  DateTime? _selectedDate = null;
  void submitData() {
    final tit = title.text;
    final amt = double.parse(amount.text);
    if (tit.isEmpty || amt <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTxFx(tit, amt, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: TextField(
          decoration: InputDecoration(
            labelText: "Expences Title",
          ),
          controller: title,
          onSubmitted: (_) => submitData(),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: TextField(
          controller: amount,
          decoration:
              InputDecoration(labelText: "Expences Amount", prefixText: "₹ "),
          keyboardType: TextInputType.number,
          onSubmitted: (_) => submitData(),
        ),
      ),
      Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _selectedDate == null
                    ? "No date chosen!!"
                    : "Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}",
              ),
            ),
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text("Chose date"),
            )
          ],
        ),
      ),
      TextButton(onPressed: () => submitData(), child: Text("Submit"))
    ]);
  }
}
