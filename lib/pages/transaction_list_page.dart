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
          102.0,
          Store(2, "Amazon", 1, HashMap<String, int>(), "Shopping"),
          "Test reference",
          DateTime.now()),
      Transaction(
          3.6,
          Store(1, "Tesco", 2, HashMap<String, int>(), "Groceries"),
          "Test reference",
          DateTime.now()),
      Transaction(
          20.0,
          Store(3, "Unknown", 0, HashMap<String, int>(), "Unknown"),
          "Test reference",
          DateTime.now()),
    ],
  );

  Card displayTransaction(Transaction transaction,
          {Color oddColour = Colors.white}) =>
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Container(
            padding: EdgeInsets.only(
                top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(transaction.store.name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(transaction.formattedValue(),
                            style: TextStyle(fontSize: 16.0))
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          children: [
                            Icon(
                              IconData(59108, fontFamily: 'MaterialIcons'),
                              color: transaction.store.sustainabilityScore >= 2
                                  ? Colors.green
                                  : Colors.white,
                            ),
                          ],
                        ))
                  ],
                )
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.blue,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Balance",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              _user.balanceString(),
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _user.transactions.length,
                      itemBuilder: (context, int i) {
                        return displayTransaction(_user.transactions[i]);
                      }),
                ),
              ],
            )));
  }
}
