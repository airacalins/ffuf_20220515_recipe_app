import 'package:ffuf_20220513_recipe_app/enums/cuisine.dart';
import 'package:ffuf_20220513_recipe_app/enums/enums.dart';
import 'package:flutter/material.dart';

class Food with ChangeNotifier {
  final String id;
  final String name;
  final String imageUrl;
  final Courses course;
  final Cuisine cuisine;
  final Difficulty difficulty;
  final Affordability affordability;
  final int preparationTime;
  final int cookingTime;
  final int servings;
  final List<String> ingredients;
  final List<String> instructions;
  bool isFavorite;

  Food({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.course,
    required this.cuisine,
    required this.difficulty,
    required this.affordability,
    required this.preparationTime,
    required this.cookingTime,
    required this.servings,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });

  String get courseText {
    switch (course) {
      case Courses.Appetizer:
        return 'Appetizer';
      case Courses.Dessert:
        return 'Dessert';
      case Courses.Drinks:
        return 'Drinks';
      case Courses.MainDish:
        return 'Main Dish';
      case Courses.Rice:
        return 'Rice';
      case Courses.Salad:
        return 'Salad';
      case Courses.SideDish:
        return 'Side Dish';
      case Courses.Soup:
        return 'Soup';
      default:
        return 'Not in the courses';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Cheap:
        return 'Cheap';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Expensive:
        return 'Expensive';
      default:
        return 'Affordability';
    }
  }

  String get difficultyText {
    switch (difficulty) {
      case Difficulty.EasyPeasy:
        return 'Easy Peasy';
      case Difficulty.TotallyDoable:
        return 'Totally Doable';
      case Difficulty.Challenging:
        return ' Challenging';
      default:
        return 'Difficulty';
    }
  }

  String get cuisineText {
    switch (cuisine) {
      case Cuisine.Asian:
        return 'Asian';
      case Cuisine.Chinese:
        return 'Chinese';
      case Cuisine.Filipino:
        return 'Filipino';
      case Cuisine.French:
        return 'French';
      case Cuisine.Greek:
        return 'Greek';
      case Cuisine.Indian:
        return 'Indian';
      case Cuisine.Japanese:
        return 'Japanese';
      case Cuisine.Lebanese:
        return 'Lebanese';
      case Cuisine.Mediterranean:
        return 'Mediterranean';
      case Cuisine.Moroccan:
        return 'Moroccan';
      case Cuisine.Spanish:
        return 'Spanish';
      case Cuisine.Thai:
        return 'Thai';
      default:
        return 'Cuisine';
    }
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
