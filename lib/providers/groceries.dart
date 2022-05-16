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

  int get totalItems {
    return _groceries.fold(0,
        (previousValue, groceryItem) => previousValue + groceryItem.quantity);
  }

  void addItem(String name) {
    var existingGroceryIndex = _groceries.indexWhere((g) => g.name == name);
    if (existingGroceryIndex > -1) {
      _groceries[existingGroceryIndex].quantity =
          _groceries[existingGroceryIndex].quantity + 1;
    } else {
      _groceries.add(Grocery(name, 1));
    }
    notifyListeners();
  }

  void addItems(List<String> items) {
    items.forEach((item) {
      addItem(item);
    });
  }
}
