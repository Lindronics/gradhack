import 'package:flutter/material.dart';

class Map1 extends StatefulWidget {
  Map1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Map1State createState() => _Map1State();
}

class _Map1State extends State<Map1> {
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
