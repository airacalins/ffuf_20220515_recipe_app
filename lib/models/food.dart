import 'package:ffuf_20220513_recipe_app/enums/enums.dart';

class Food {
  final String id;
  final String name;
  final String imageUrl;
  final Courses course;
  final String cuisineId;
  final Difficulty difficulty;
  final Affordability affordability;
  final String preparationTime;
  final String cookingTime;
  final int servings;
  final List<String> ingredients;
  final List<String> instructions;
  bool isFavorite;

  Food({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.course,
    required this.cuisineId,
    required this.difficulty,
    required this.affordability,
    required this.preparationTime,
    required this.cookingTime,
    required this.servings,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}
