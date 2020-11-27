import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/user.dart';

class Transaction {
  User user;
  double value;
  Store store;
  String reference;
  DateTime dateTime;

  Transaction(user, value, store, reference, dateTime) {
    this.user = user;
    this.value = value;
    this.store = store;
    this.reference = reference;
    this.dateTime = dateTime;
  }
}
