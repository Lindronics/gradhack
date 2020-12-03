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

  int sustainabilityScore() {
    return this.individualScores.values.reduce((e, v) => e + v);
  }

  Row getLeaves({double size = 24.0, String category}) {
    List<int> steps =
        category != null ? List.of([1, 2, 3]) : List.of([3, 6, 9]);
    int score = category != null
        ? this.individualScores[category]
        : this.sustainabilityScore();

    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: score >= steps[0] ? Colors.green : Colors.grey[400],
          size: size,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: score >= steps[1] ? Colors.green : Colors.grey[400],
          size: size,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: score >= steps[2] ? Colors.green : Colors.grey[400],
          size: size,
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
