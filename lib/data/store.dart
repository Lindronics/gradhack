import 'dart:collection';

import 'dart:ffi';

class Store {
  int id;
  String name;
  int sustainabilityScore;
  HashMap<String,int> individualScores;
  String category;
  int score1;
  int score2;
  int score3;

  Store(id, name, sustainabilityScore, HashMap<String,int>individualScores, category) {
    this.id = id;
    this.name = name;
    this.sustainabilityScore = sustainabilityScore;
    this.individualScores = individualScores;
    this.category = category;
  }


}
