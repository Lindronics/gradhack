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
  List<int> initialScore;

  Store(this.id, this.name, this.sustainabilityScore, this.category,this.individualScores,
      this.initialScore, this.location);

HashMap<String,int> individualScore(initialScore){
    this.individualScores.putIfAbsent("Organic", () => initialScore[0]);
    this.individualScores.putIfAbsent("Energy", () => initialScore[1]);
    this.individualScores.putIfAbsent("Recycle", () => initialScore[2]);
return this.individualScores;
}

int calculateSustainabilityScore(list){
  this.sustainabilityScore = list[0]+list[1]+list[2];
  return this.sustainabilityScore;
}

  Row getTransactionLeaves(initialscore){
    return Row(
      children:[
        Icon(Icons.eco, 
          color: initialscore[0]+initialscore[1]+ initialscore[2]>= 3 ?
          Colors.green : Colors.white),
        Icon(Icons.eco, 
          color: initialscore[0]+initialscore[1]+ initialscore[2]>= 6 ?        
          Colors.green : Colors.white),
        Icon(Icons.eco, 
          color: initialscore[0]+initialscore[1]+ initialscore[2]>= 9 ?        
          Colors.green : Colors.white)
      ]
    );
  }

  Row getLeaves() {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 3 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 6 ? Colors.green : Colors.white,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 9 ? Colors.green : Colors.white,
        ),
      ],
    );
  }

  Row getLargeLeaves() {
    return Row(
      children: [
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 3 ? Colors.green : Colors.grey[400],
          size: 35,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 6 ? Colors.green : Colors.grey[400],
          size: 35,
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.sustainabilityScore >= 9 ? Colors.green : Colors.grey[400],
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
          color: this.individualScores[category] >= 1 ? Colors.green : Colors.grey[400],
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.individualScores[category] >= 2 ? Colors.green : Colors.grey[400],
        ),
        Icon(
          IconData(59108, fontFamily: 'MaterialIcons'),
          color: this.individualScores[category] >= 3 ? Colors.green : Colors.grey[400],
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
