import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:cr_personal_expenses/widgets/chart.dart';
import 'package:cr_personal_expenses/widgets/new_transaction.dart';
import 'package:cr_personal_expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {


  final List<Transaction> _transactions = [
  /*  Transaction(
        id: 't1', title: 'new shoes', amount: 200.0, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new t-shirt', amount: 75.25, date: DateTime.now()),*/
  ];


  void _addNewTransaction(String xTitle, double xAmount, DateTime pickedDate) {

    final Transaction tr =Transaction(
      title: xTitle,
      amount: xAmount,
      id: _transactions.length.toString(),
      date: pickedDate,
    );

    setState(() {
      _transactions.add(tr);
    });

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(child: NewTransaction(_addNewTransaction),
      onTap: (){},
      behavior: HitTestBehavior.opaque,);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override

  Widget build(BuildContext context) {
    print('build_home');
    final appBar = AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(Icons.add),
        )
      ],
      title: Text(widget.title),
    );

    final txListWidget =  Container(
        height: (MediaQuery.of(context).size.height - appBar.preferredSize.height -
            MediaQuery.of(context).padding.top) * 0.7,
        child: TransactionList(_transactions, _deleteTransaction));

    return Scaffold(
      appBar:appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height
                - appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) * 0.3,
                child: Chart(_recentTransactions)),
           txListWidget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add, ), onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
