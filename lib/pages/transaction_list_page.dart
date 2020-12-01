import 'package:flutter/material.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:gradhack/data/user.dart';
import 'package:gradhack/pages/profile_page.dart';
import 'package:gradhack/pages/transaction_detail_page.dart';

class TransactionListPage extends StatefulWidget {
  TransactionListPage({Key key}) : super(key: key);
  final String title = "Transactions";
  static const String routeName = "/transaction_list";

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  Widget displayTransaction(Transaction transaction,
          {Color oddColour = Colors.white}) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TransactionDetailPage(title: transaction.store.name)),
          );
        },
        child: Card(
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
                          Text(Transaction.formattedValue(transaction.value),
                              style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: [
                              Icon(
                                IconData(59108, fontFamily: 'MaterialIcons'),
                                color:
                                    transaction.store.sustainabilityScore >= 2
                                        ? Colors.green
                                        : Colors.white,
                              ),
                            ],
                          ))
                    ],
                  )
                ],
              )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    User _user = ModalRoute.of(context).settings.arguments;

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
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.routeName,
                    arguments: _user);
              },
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
