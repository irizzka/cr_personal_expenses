import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> list;

  TransactionList(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text('\$ ${list[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.purple),),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(list[index].title, style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black
                    ),),
                    Text(
                      DateFormat.yMMMd().format(
                          list[index].date), style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),)
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: list.length,

      ),
    );
  }
}