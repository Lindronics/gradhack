import 'package:gradhack/data/transaction.dart';

class User {
  String name;
  int id;
  double balance;
  int _sustainabilityScore;
  List<Transaction> transactions;

  User(id, name, balance, transactions) {
    this.id = id;
    this.name = name;
    this.balance = balance;
    this.transactions = transactions;
  }

  int sustainabilityScore() {
    // TODO
    return 0;
  }
}
