import 'package:flutter/material.dart';
import 'package:gradhack/pages/Store1Map.dart';
import 'package:gradhack/pages/Store2Map.dart';
import 'package:gradhack/pages/Store3Map.dart';

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
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Store1Map(title: "Store 1 Map")),
                );
              },
              child: Text("Store 1"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Store2Map(title: "Store 2 Map")),
                );
              },
              child: Text("Store 2"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Store3Map(title: "Store 3 Map")),
                );
              },
              child: Text("Store 3"),
            ),
          ],
        ),
      ),
    );
  }
}
