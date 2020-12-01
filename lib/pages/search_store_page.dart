import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/components/map.dart';
import 'package:gradhack/data/user.dart';

import 'transaction_list_page.dart';

class SearchArguments {
  User user;
  List<Store> stores;

  SearchArguments(this.user, this.stores);
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);
  final String title = "Store search";
  static const String routeName = "/search_store";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 2;
  
  @override
  Widget build(BuildContext context) {
    final SearchArguments args = ModalRoute.of(context).settings.arguments;
    List<Store> _stores = args.stores;
    User _user = args.user;

void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {Navigator.pushNamed(context, TransactionListPage.routeName,arguments: _user);
    } if (index == 2 ) {{Navigator.pushNamed(context, SearchPage.routeName,arguments: SearchArguments(_user, _stores));}}
  });}

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.red,
          elevation: 0.0,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          )),
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemExtent: 129.0,
          itemCount: _stores.length,
          itemBuilder: (context, int i) {
            return CustomListItem(
              store: _stores[i],
              user: _user,
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
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
            child: Icon(store.getIcons(store.category), color: Colors.black, size: 50.0,)
          ),
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
                      borderRadius: BorderRadius.circular(15.0),),
                ),
              ])
        ],
      ),
    );
  }
}
