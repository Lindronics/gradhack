import 'package:gradhack/data/store.dart';
import 'package:gradhack/data/user.dart';

class Transaction {
  double value;
  Store store;
  String reference;
  DateTime dateTime;

  Transaction(value, store, reference, dateTime) {
    this.value = value;
    this.store = store;
    this.reference = reference;
    this.dateTime = dateTime;
  }

  String formattedValue() {
    return "£ ${this.value.toStringAsFixed(2)}";
  }
}
