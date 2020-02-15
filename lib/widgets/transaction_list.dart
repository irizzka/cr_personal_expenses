import 'package:cr_personal_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> list;
  final Function _deleteTr;

  TransactionList(this.list, this._deleteTr);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: list.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text('\$${list[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        list[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle:
                          Text(DateFormat.yMMMd().format(list[index].date)),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () => _deleteTr(list[index].id),
                      ),
                      //trailing: ,
                    ),
                  );
                },
                itemCount: list.length,
              )
            : Column(children: <Widget>[
                Text('No transactions'),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ]));
  }
}
