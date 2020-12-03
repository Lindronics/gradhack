import 'package:flutter/material.dart';
import 'package:gradhack/data/transaction.dart';
import 'package:intl/intl.dart';

class MerchantDetail extends StatefulWidget {
  MerchantDetail({Key key}) : super(key: key);
  static const String routeName = "/transaction";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MerchantDetail> {
  @override
  Widget build(BuildContext context) {
    Transaction _transaction = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(_transaction.store.name),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://static1.squarespace.com/static/5b1aa23650a54fdaa3095e21/t/5b1aa5e5575d1fdfb8fd5218/1603888795061/?format=1500w",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        Transaction.formattedValue(_transaction.value),
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        DateFormat('dd/MM/yyy kk:mm')
                            .format(_transaction.dateTime),
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        _transaction.reference,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Sustainability Score",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: Colors.black)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  left: 152.0,
                                  right: 150.0,
                                  bottom: 10.0),
                              child: Container(
                                  child: Row(children: <Widget>[
                                _transaction.store.getLeaves(size: 35.0),
                              ])))),
                      Text(
                        "This merchant has been certified to be ",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "sustainable.",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            width: 110.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.redAccent, Colors.red]),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 110.0, minHeight: 35.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Learn More",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("Breakdown",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black)),
          SizedBox(
            height: 20.0,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: 0.0, left: 50.0, right: 50.0, bottom: 10.0),
              child: Column(
                children: _transaction.store.individualScores.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(e.key, style: TextStyle(fontSize: 18.0)),
                        _transaction.store.getLeaves(category: e.key),
                      ],
                    ),
                  );
                }).toList(),
              )),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
