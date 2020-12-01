import 'package:flutter/material.dart';

class MapComponent extends StatefulWidget {
  MapComponent({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
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
