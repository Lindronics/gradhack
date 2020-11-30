import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gradhack/pages/Map1.dart';
import 'package:gradhack/pages/Store1Map.dart';
import 'package:gradhack/pages/Store2Map.dart';
import 'package:gradhack/pages/Store3Map.dart';

class SearchPage1 extends StatefulWidget {
  SearchPage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchPage1State createState() => _SearchPage1State();
}

class _SearchPage1State extends State<SearchPage1> {
  static const String _title = 'Search Store';    // Name of page.

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: MyStatelessWidget(),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.title,
    this.user,
    this.score,
    this.score2,
    this.score3,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final IconData score;
  final IconData score2;
  final IconData score3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // Space between the tiles.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,                        // Width of the boxes before text -> Could be replaced with Icons of stores.
            child: thumbnail,
          ),
          Expanded(
            flex: 3,                        // Width of text box beside the icon
            child: _StoreDescription(
              title: title,
              user: user,
            ),
          ),
          Icon(
            score,                //The more icon -> could be switched to go or expand icon.
            size: 22.0,
            color:Colors.green,
          ),
          Icon(
            score2,                //The more icon -> could be switched to go or expand icon.
            size: 22.0,
            color:Colors.green,
          ),
          Icon(
            score3,                //The more icon -> could be switched to go or expand icon.
            size: 22.0,
            color:Colors.green,
          ),
        ],
      ),
    );
  }
}

class _StoreDescription extends StatelessWidget {
  const _StoreDescription({
    Key key,
    this.title,
    this.user,
    this.score,
    this.score2,
    this.score3
  }) : super(key: key);

  final String title;
  final String user;
  final IconData score;
  final IconData score2;
  final IconData score3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),       // padding of the tiles
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,            //refers to 1st line of Text in CustomListItem
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,                       //Font size of 1st line of text.
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),        //spacing between 1st & 2nd lines of text
          Text(                                                               //2nd line of text HERE
            user,         //2nd line of text variable in CustomListItem
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),        //spacing between 2nd & 3rd lines of text.
          Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Map1(title: title)), //Add location details here to be passed into the Map1 Page
                );
              },
              child: Text("View on Map"),
            ),
          ])],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

static const IconData eco = IconData(0xe6e4, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <CustomListItem>[
        CustomListItem(
          user: '0.51km',
          score: (Icons.eco),
          score2: (Icons.eco),
          score3: null,
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: 'Sustainable Store 1',
        ),
        CustomListItem(
          user: '1.75km',
          score:(Icons.eco),
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.yellow),
          ),
          title: 'Sustainable Store 2',
        ),
      ],
    );
  }
}
