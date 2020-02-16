import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTr;

  NewTransaction(this.addTr);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _tittleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {

    if(_amountController.text.isEmpty){
      return;
    }

    final enteredTitle = _tittleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTr(enteredTitle, enteredAmount,_selectedDate);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _tittleController,
                //  onChanged: (value) => _titleInput = value,
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                //  onChanged: (value) => _amountInput = value,
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked ${DateFormat.yMMMd().format(_selectedDate)}'),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: const Text(
                  'Add Transaction',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
