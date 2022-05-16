// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  const FoodItem(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        FoodDetailsScreen.routeName,
        arguments: food.id,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image(
            image: AssetImage(
              'assets/images/salmon.jpg',
            ),
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(food.name),
            trailing: IconButton(
              icon: Icon(
                  food.isFavorite ? Icons.favorite_border : Icons.favorite),
              onPressed: () {},
            ),
          ),
          // child: Image.network(food.imageUrl),
        ),
      ),
    );
  }
}
