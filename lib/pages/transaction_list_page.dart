import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:gradhack/data/user.dart';
import 'package:gradhack/pages/profile_page.dart';
import 'package:gradhack/pages/search_store_page.dart';
import 'package:gradhack/pages/transaction_detail_page.dart';

class TransactionListPage extends StatelessWidget {
  TransactionListPage({Key key, this.context, this.user}) : super(key: key);
  final String title = "Transactions";
  static const String routeName = "/transaction_list";
  BuildContext context;
  User user;

  Widget displayTransaction(Transaction transaction,
          {Color oddColour = Colors.red}) =>
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
                            children: [transaction.store.getLeaves()],
                          ))
                    ],
                  )
                ],
              )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Balance",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          user.balanceString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: user.transactions.length,
                  itemBuilder: (context, int i) {
                    return displayTransaction(user.transactions[i]);
                  }),
            ),
          ],
        ));
  }
}
