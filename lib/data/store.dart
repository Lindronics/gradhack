import 'dart:collection';

class Store {
  int id;
  String name;
  int sustainabilityScore;
  HashMap<String, int> individualScores;
  String category;

  Store(id, name, sustainabilityScore, individualScores, category) {
    this.id = id;
    this.name = name;
    this.sustainabilityScore = sustainabilityScore;
    this.individualScores = individualScores;
    this.category = category;
  }
}
