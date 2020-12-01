import 'dart:collection';
import 'package:flutter/material.dart';

class Store {
  int id;
  String name;
  int sustainabilityScore;
  HashMap<String, int> individualScores;
  String category;
  int score1;
  int score2;
  int score3;
  String mapTitle;
  IconData logo;

  Store(id, name, sustainabilityScore, HashMap<String, int> individualScores,
      category) {
    this.id = id;
    this.name = name;
    this.sustainabilityScore = sustainabilityScore;
    this.individualScores = individualScores;
    this.category = category;
  }

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

IconData getIcons(String category){
  if (category == "Groceries"){
      return Icons.store;
  }
    if (category == "Shopping"){
      return Icons.shopping_cart; 
  }
    if (category == "Unknown"){
      return Icons.help;
  }
}
}
