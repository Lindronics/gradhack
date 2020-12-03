import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Store {
  int id;
  String name;
  String category;
  String mapTitle;
  IconData logo;
  LatLng location;
  HashMap<String, int> individualScores;

  Store(
    this.id,
    this.name,
    this.category,
    this.location, {
    organic = 0,
    energy = 0,
    recycle = 0,
  }) {
    this.individualScores = HashMap.from({
      "Organic": organic,
      "Energy": energy,
      "Recycle": recycle,
    });
  }

  Row getTransactionLeaves() {
    return Row(children: [
      Icon(Icons.eco,
          color: sustainabilityScore() >= 3 ? Colors.green : Colors.white),
      Icon(Icons.eco,
          color: sustainabilityScore() >= 6 ? Colors.green : Colors.white),
      Icon(Icons.eco,
          color: sustainabilityScore() >= 9 ? Colors.green : Colors.white)
    ]);
  }

  int sustainabilityScore() {
    return this.individualScores.values.reduce((e, v) => e + v);
  }

  Row getLeaves() {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore() >= 3 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore() >= 6 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore() >= 9 ? Colors.green : Colors.white,
        ),
      ],
    );
  }

  Row getLargeLeaves() {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color:
              this.sustainabilityScore() >= 3 ? Colors.green : Colors.grey[400],
          size: 35,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color:
              this.sustainabilityScore() >= 6 ? Colors.green : Colors.grey[400],
          size: 35,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color:
              this.sustainabilityScore() >= 9 ? Colors.green : Colors.grey[400],
          size: 35,
        ),
      ],
    );
  }

  Row getIndividualScoreLeaf(String category) {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.individualScores[category] >= 1
              ? Colors.green
              : Colors.grey[400],
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.individualScores[category] >= 2
              ? Colors.green
              : Colors.grey[400],
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.individualScores[category] >= 3
              ? Colors.green
              : Colors.grey[400],
        ),
      ],
    );
  }

  IconData getIcons(String category) {
    if (category == "Shopping") {
      return Icons.store;
    }
    if (category == "Groceries") {
      return Icons.shopping_cart;
    }
    return Icons.help;
  }
}
