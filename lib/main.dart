import 'package:flutter/material.dart';
import 'package:gradhack/pages/profile_page.dart';
import 'package:gradhack/pages/search_store_page.dart';
import 'package:gradhack/pages/transaction_detail_page.dart';
import 'package:gradhack/pages/transaction_list_page.dart';

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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DummyMainPage(title: 'Transactions'),
      routes: {
        ProfilePage.routeName: (context) => ProfilePage(),
        SearchPage.routeName: (context) => SearchPage(),
        TransactionDetailPage.routeName: (context) => TransactionDetailPage(),
        TransactionListPage.routeName: (context) => TransactionListPage(),
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
                Navigator.pushNamed(context, TransactionListPage.routeName,
                    arguments: "Transactions");
              },
              child: Text("Transaction list"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TransactionDetailPage(title: "Transaction detail")),
                );
              },
              child: Text("Transaction detail"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(title: "Profile")),
                );
              },
              child: Text("Profile"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchPage(title: "Search")),
                );
              },
              child: Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}

// Starting the Search Page HERE
