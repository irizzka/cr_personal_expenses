import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:cr_personal_expenses/widgets/transaction_item_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  final Function _deleteTr;

  TransactionList(this.list, this._deleteTr);

  @override
  Widget build(BuildContext context) {
    print('build transaction_list');
    return list.isNotEmpty
        ? ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItemCard(deleteTr: _deleteTr, transaction: list[index] );
      },
      itemCount: list.length,
    )
        : LayoutBuilder(
      builder: (context, constraints) {
        return Column(children: <Widget>[
          const Text('No transactions'),
         const SizedBox(
            height: 20.0,
          ),
          Container(
            height: (constraints.maxHeight - MediaQuery.of(context).padding.top) * 0.4,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),),
        ],);
      },

    );
  }
}

