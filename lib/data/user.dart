import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradhack/data/transaction.dart';

class User {
  String name;
  int id;
  double balance;
  List<Transaction> transactions;

  User(id, name, balance, transactions) {
    this.id = id;
    this.name = name;
    this.balance = balance;
    this.transactions = transactions;
  }

  String balanceString() {
    return "£ ${this.balance.toStringAsFixed(2)}";
  }

  int greenPoints() {
    return this
        .transactions
        .map((e) => e.store.sustainabilityScore)
        .reduce((v, e) => v + e);
  }

  double totalExpenditures() {
    return this.transactions.map((e) => e.value).reduce((v, e) => v + e);
  }

getDownArrows(int a) {
    return Row(
      children: [
        Icon(Icons.south, color: a >= 0 && a<6 ? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 6 && a<12 ? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 12 && a<18? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 18 && a<24? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 24 && a<30? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 30 && a<36? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 36 && a<42? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 42 && a<48? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 48 && a<54? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 54 && a<60? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 60 && a<66? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 66 && a<72? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 72 && a<78? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 78 && a<84? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 84 && a<90? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 90 && a<96? Colors.black : Colors.white),
        Icon(Icons.south, color: a >= 96 && a<100? Colors.black : Colors.white),
      ],
    );
  }

getUpArrows(int a) {
    return Row(
      children: [
        Icon(Icons.north, color: a >= 0 && a<6 ? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 6 && a<12 ? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 12 && a<18? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 18 && a<24? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 24 && a<30? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 30 && a<36? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 36 && a<42? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 42 && a<48? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 48 && a<54? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 54 && a<60? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 60 && a<66? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 66 && a<72? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 72 && a<78? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 78 && a<84? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 84 && a<90? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 90 && a<96? Colors.black : Colors.white),
        Icon(Icons.north, color: a >= 96 && a<100? Colors.black : Colors.white),
      ],
    );
  }
}