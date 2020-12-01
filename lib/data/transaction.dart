import 'package:gradhack/data/store.dart';

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

  static String formattedValue(double value) {
    return "£ ${value.toStringAsFixed(2)}";
  }
}
