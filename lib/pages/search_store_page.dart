import 'package:flutter/material.dart';

class SearchStorePage extends StatefulWidget {
  SearchStorePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchStorePageState createState() => _SearchStorePageState();
}

class _SearchStorePageState extends State<SearchStorePage> {
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
