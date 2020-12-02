import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradhack/data/store.dart';

class MapComponent extends StatefulWidget {
  MapComponent({Key key}) : super(key: key);
  static const String routeName = "/map";

  @override
  _MapComponentState createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  @override
  Widget build(BuildContext context) {
    Store _store = ModalRoute.of(context).settings.arguments;
    print(_store);

    return Scaffold(
      appBar: AppBar(
        title: Text(_store.name),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _store.location,
          zoom: 16.0,
        ),
        markers: Set<Marker>.from([
          Marker(
            markerId: MarkerId(_store.name),
            position: _store.location,
            consumeTapEvents: true,
          )
        ]),
      ),
    );
  }
}
