import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:flutter/material.dart';

class Foods with ChangeNotifier {
  List<Food> _foods = List.empty(growable: true);

  List<Food> get foods {
    return [..._foods];
  }

  void createFood(Food food) {
    _foods.add(food);
    notifyListeners();
  }
}
