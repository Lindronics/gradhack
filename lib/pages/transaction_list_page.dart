import 'package:flutter/material.dart';

class TransactionListPage extends StatefulWidget {
  TransactionListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
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
            Text(
              'Placeholder',
            ),
          ],
        ),
      ),
    );
  }
}
