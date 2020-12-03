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
  Widget _aboutDialog(BuildContext context, Transaction transaction) {
    return new AlertDialog(
      title: const Text("HSBC green certification"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              transaction.store.getLeaves(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
              "This is an informational text explaining what the HSBC green certification is and how it works. Lorem ipsum dolor sit amnet."),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text("Okay"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Transaction _transaction = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(_transaction.store.name),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
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
              DateFormat('dd/MM/yyy kk:mm').format(_transaction.dateTime),
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
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _transaction.store.getLeaves(size: 35.0),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "This merchant has been certified to be sustainable.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _aboutDialog(context, _transaction),
                  );
                },
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
                  children:
                      _transaction.store.individualScores.entries.map((e) {
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
      ),
    );
  }
}
