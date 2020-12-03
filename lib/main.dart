import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradhack/components/map.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:gradhack/data/user.dart';
import 'package:gradhack/pages/profile_page.dart';
import 'package:gradhack/pages/search_store_page.dart';
import 'package:gradhack/pages/transaction_list_page.dart';
import 'package:gradhack/pages/Merchant_Details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DummyMainPage(title: 'HSBC'),
      routes: {
        ProfilePage.routeName: (context) => ProfilePage(),
        SearchStorePage.routeName: (context) => SearchStorePage(),
        MerchantDetail.routeName: (context) => MerchantDetail(),
        TransactionListPage.routeName: (context) => TransactionListPage(),
        MapComponent.routeName: (context) => MapComponent(),
      },
    );
  }
}

class DummyMainPage extends StatefulWidget {
  DummyMainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DummyMainPageState createState() => _DummyMainPageState();
}

class _DummyMainPageState extends State<DummyMainPage> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Store> _stores = [
      new Store(0, "Tesco Metro", "Groceries", LatLng(51.5143636, -0.0973289),
          organic: 2, energy: 3, recycle: 1),
      new Store(1, "Amazon", "Shopping", null,
          organic: 2, energy: 3, recycle: 1),
      new Store(
          2, "Sainsbury's Local", "Groceries", LatLng(51.5143768, -0.0973503),
          organic: 2, energy: 3, recycle: 1),
    ];

    User _user = User(
      1,
      "Person One",
      1234.56,
      [
        Transaction(20.87, _stores[0], "Test reference", DateTime.now()),
        Transaction(102.0, _stores[1], "Test reference", DateTime.now()),
        Transaction(3.6, _stores[2], "Test reference", DateTime.now()),
        Transaction(25.2, _stores[0], "Test reference", DateTime.now()),
      ],
    );

    List<Widget> _pages = <Widget>[
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      TransactionListPage(context: context, user: _user, stores: _stores),
      SearchStorePage(stores: _stores, user: _user),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 250), curve: Curves.easeOut);
      });
    }

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
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProfilePage.routeName,
                  arguments: _user);
            },
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _pages,
      ),
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
