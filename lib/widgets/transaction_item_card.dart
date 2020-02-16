import 'dart:math';

import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItemCard extends StatefulWidget {
  const TransactionItemCard({
    Key key,
    @required this.transaction,
    @required Function deleteTr,
  }) : _deleteTr = deleteTr, super(key: key);

  final Transaction transaction;
  final Function _deleteTr;

  @override
  _TransactionItemCardState createState() => _TransactionItemCardState();
}

class _TransactionItemCardState extends State<TransactionItemCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme
              .of(context)
              .textTheme
              .title,
        ),
        subtitle:
        Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme
                .of(context)
                .errorColor,
          ),
          onPressed: () => widget._deleteTr(widget.transaction.id),
        ),
        //trailing: ,
      ),
    );
  }
}
