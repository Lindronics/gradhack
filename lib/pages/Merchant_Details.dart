import 'package:flutter/material.dart';

class MerchantDetail extends StatefulWidget {
  MerchantDetail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MerchantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                        "€ 12.00",
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
                        "12/12/2020  15:00",
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
                        "payment reference lorem ipsum dolor sit amnet"

                        ,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Sustainability Score",style: TextStyle(fontWeight: FontWeight.bold,fontSize : 28.0,color: Colors.black)),
                      SizedBox(
                        height: 10.0,
                      ),

                      Icon(
                        Icons.eco,
                        color: Colors.green,
                        size: 30.0,
                      ),
                      Text(
                        "This merchant has been certified to be "

                        ,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "sustainable"

                        ,
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
          Text("Breakdown",style: TextStyle(fontWeight: FontWeight.bold,fontSize : 28.0,color: Colors.black)),
          SizedBox(
            height: 20.0,
          ),
          Text("Organic Products                      ",textAlign: TextAlign.left,style: TextStyle(fontSize : 18.0,color: Colors.black)),
          Icon(
            Icons.eco,
            color: Colors.green,
            size: 30.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text("Green Energy                        ",textAlign: TextAlign.left,style: TextStyle(fontSize : 18.0,color: Colors.black)),
          Icon(
            Icons.eco,
            color: Colors.green,
            size: 30.0,
          ),

          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}