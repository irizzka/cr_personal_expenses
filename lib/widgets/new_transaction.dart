import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTr;

  NewTransaction(this.addTr);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _tittleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
   final enteredTitle = _tittleController.text;
   final enteredAmount = double.parse(_amountController.text);

   if(enteredTitle.isEmpty || enteredAmount <= 0){
     return;
   }

   widget.addTr(
     enteredTitle,
     enteredAmount
   );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _tittleController,
              //  onChanged: (value) => _titleInput = value,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => submitData() ,
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData() ,
              //  onChanged: (value) => _amountInput = value,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
