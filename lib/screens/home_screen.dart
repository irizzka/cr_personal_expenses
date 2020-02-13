import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:cr_personal_expenses/widgets/new_transaction.dart';
import 'package:cr_personal_expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 200.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new t-shirt', amount: 75.25, date: DateTime.now()),
  ];


  void _addNewTransaction(String xTitle, double xAmount) {

    final Transaction tr =Transaction(
      title: xTitle,
      amount: xAmount,
      id: _transactions.length.toString(),
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(tr);
    });

    Navigator.of(context).pop();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(child: NewTransaction(_addNewTransaction),
      onTap: (){},
      behavior: HitTestBehavior.opaque,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.purpleAccent,
              child: Container(
                width: double.infinity,
                child: Text('Chart'),
              ),
              elevation: 5,
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add, ), onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
