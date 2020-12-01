import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Store {
  int id;
  String name;
  int sustainabilityScore;
  HashMap<String, int> individualScores;
  String category;
  String mapTitle;
  IconData logo;
  LatLng location;

  Store(this.id, this.name, this.sustainabilityScore, this.category,
      {this.individualScores, this.location});

  Row getLeaves() {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 1 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 2 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 3 ? Colors.green : Colors.white,
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
    if (category == "Unknown") {
      return Icons.help;
    }
  }
}
