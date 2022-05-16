// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodItem extends StatelessWidget {
  // final Food food;
  // const FoodItem(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final food = Provider.of<Food>(context, listen: false);

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        FoodDetailsScreen.routeName,
        arguments: food.id,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image(
            image: NetworkImage(food.imageUrl),
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(food.name),
            trailing: Consumer<Food>(builder: (context, food, _) {
              return IconButton(
                icon: Icon(
                    food.isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  food.toggleFavorite();
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
