// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class Grocery {
  String name;
  int quantity;

  Grocery(this.name, this.quantity);
}

class Groceries with ChangeNotifier {
  List<Grocery> _groceries = List.empty(growable: true);

  List<Grocery> get groceries => [..._groceries];

  void addItem(Grocery grocery) {
    var existingGroceryIndex =
        _groceries.indexWhere((g) => g.name == grocery.name);
    if (existingGroceryIndex > -1) {
      _groceries[existingGroceryIndex].quantity =
          _groceries[existingGroceryIndex].quantity + grocery.quantity;
    } else {
      _groceries.add(Grocery(grocery.name, grocery.quantity));
      // notifyListeners();
    }
  }
}
