import 'dart:collection';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/components/map.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);
  final String title = "Store search";
  static const String routeName = "/search_store";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    List<Store> _stores = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemExtent: 106.0,
          itemCount: _stores.length,
          itemBuilder: (context, int i) {
            return CustomListItem(
              store: _stores[i],
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            );
          }),
    );
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    this.thumbnail,
    this.store,
  });

  final Widget thumbnail;
  final Store store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10.0), // Space between the tiles.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex:
                1, // Width of the boxes before text -> Could be replaced with Icons of stores.
            child: thumbnail,
          ),
          Expanded(
            flex: 3, // Width of text box beside the icon
            child: _StoreDescription(
              title: store.name,
              // user1: user,
            ),
          ),
          store.getLeaves(),
        ],
      ),
    );
  }
}

class _StoreDescription extends StatelessWidget {
  const _StoreDescription(
      {Key key, this.title, this.user1, this.icon1, this.icon2, this.icon3})
      : super(key: key);

  final String title;
  final String user1;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0), // padding of the tiles
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title, //refers to 1st line of Text in CustomListItem
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0, //Font size of 1st line of text.
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 2.0)), //spacing between 1st & 2nd lines of text
          Text(
            //2nd line of text HERE
            user1.toString(), //2nd line of text variable in CustomListItem
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 1.0)), //spacing between 2nd & 3rd lines of text.
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapComponent(
                              title:
                                  title)), //Add location details here to be passed into the Map1 Page
                    );
                  },
                  child: Text("View on Map"),
                ),
              ])
        ],
      ),
    );
  }
}
