import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:gradhack/data/user.dart';

class TransactionListPage extends StatefulWidget {
  TransactionListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  User _user = User(
    1,
    "Test",
    1234.56,
    [
      Transaction(
          20.0,
          Store(1, "Tesco", 2, HashMap<String, int>(), "Groceries"),
          "Test reference",
          DateTime.now()),
      Transaction(
          20.0,
          Store(1, "Tesco", 2, HashMap<String, int>(), "Groceries"),
          "Test reference",
          DateTime.now()),
      Transaction(
          20.0,
          Store(1, "Tesco", 2, HashMap<String, int>(), "Groceries"),
          "Test reference",
          DateTime.now()),
      Transaction(
          20.0,
          Store(1, "Tesco", 2, HashMap<String, int>(), "Groceries"),
          "Test reference",
          DateTime.now()),
    ],
  );

  Container displayTransaction(Transaction transaction,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(color: oddColour),
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(transaction.store.name, style: TextStyle(fontSize: 16.0)),
                Text(transaction.value.toString(),
                    style: TextStyle(fontSize: 16.0))
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(transaction.dateTime.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                Text(transaction.store.category,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0))
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: _user.transactions.map((element) {
                  return displayTransaction(element);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
