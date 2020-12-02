import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/components/map.dart';
import 'package:gradhack/data/user.dart';

class SearchArguments {
  User user;
  List<Store> stores;

  SearchArguments(this.user, this.stores);
}

class SearchStorePage extends StatelessWidget {
  SearchStorePage({Key key, this.stores, this.user}) : super(key: key);
  final String title = "Store search";
  static const String routeName = "/search_store";
  final List<Store> stores;
  final User user;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 129.0,
        itemCount: stores.length,
        itemBuilder: (context, int i) {
          return CustomListItem(
            store: stores[i],
            user: user,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          );
        });
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    this.thumbnail,
    this.store,
    this.user,
  });

  final Widget thumbnail;
  final Store store;
  final User user;

  @override
  Widget build(BuildContext context) {
  store.calculateSustainabilityScore(store.initialScore);
  
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 1.0), // Space between the tiles.
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex:
                          1, // Width of the boxes before text -> Could be replaced with Icons of stores.
                      child: Icon(
                        store.getIcons(store.category),
                        color: Colors.black,
                        size: 50.0,
                      )),
                  Expanded(
                    flex: 2, // Width of text box beside the icon
                    child: _StoreDescription(
                      store: store,
                      user: user.name,
                    ),
                  ),
                  store.getLeaves(),
                ],
              ),
            )));
  }
}

class _StoreDescription extends StatelessWidget {
  const _StoreDescription({Key key, this.store, this.user}) : super(key: key);

  final Store store;
  final String user;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0), // padding of the tiles
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            store.name, //refers to 1st line of Text in CustomListItem
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0, //Font size of 1st line of text.
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 1.0)), //spacing between 1st & 2nd lines of text
          Text(
            //2nd line of text HERE
            user.toString(), //2nd line of text variable in CustomListItem
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 0.0)), //spacing between 2nd & 3rd lines of text.

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    if (store.location != null) {
                      Navigator.pushNamed(context, MapComponent.routeName,
                          arguments: store);
                    }
                  },
                  child: Text("View on Map",
                      style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ])
        ],
      ),
    );
  }
}
