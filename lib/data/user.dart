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
}
