import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:gradhack/data/user.dart';
import 'package:gradhack/pages/profile_page.dart';
import 'package:gradhack/pages/search_store_page.dart';
import 'package:gradhack/pages/transaction_detail_page.dart';

class TransactionListPage extends StatefulWidget {
  TransactionListPage({Key key}) : super(key: key);
  final String title = "Transactions";
  static const String routeName = "/transaction_list";

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {

  Widget displayTransaction(Transaction transaction,
          {Color oddColour = Colors.red}) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TransactionDetailPage(title: transaction.store.name)),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(transaction.store.name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(Transaction.formattedValue(transaction.value),
                              style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: [transaction.store.getLeaves()],
                          ))
                    ],
                  )
                ],
              )),
        ),
      );

//int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    User _user = ModalRoute.of(context).settings.arguments;
    List<Store> _stores = [
      new Store(0, "Tesco Metro", 2, "Groceries",
          location: LatLng(51.5143636, -0.0973289)),
      new Store(
        1,
        "Amazon",
        1,
        "Shopping",
      ),
      new Store(2, "Sainsbury's Local", 3, "Groceries",
          location: LatLng(51.5143768, -0.0973503)),
    ];
    int _selectedIndex = 1;

void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {Navigator.pushNamed(context, TransactionListPage.routeName,arguments: _user);
      _selectedIndex = index;
    } if (index == 2) {{Navigator.pushNamed(context, SearchPage.routeName, arguments: SearchArguments(_user, _stores));
    _selectedIndex = index;}}
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
            body: Container(
                margin: EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Balance",
                                  style:
                                      TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _user.balanceString(),
                                  style:
                                      TextStyle(fontSize: 30, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: _user.transactions.length,
                          itemBuilder: (context, int i) {
                            return displayTransaction(_user.transactions[i]);
                          }),
                    ),
                  ],
                )),
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
