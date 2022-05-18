// ignore_for_file: prefer_final_fields

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:provider/provider.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  FoodListItem(this.food, {Key? key}) : super(key: key);

  SnackBar _successfullyDeletedSnackbar = const SnackBar(
    content: const Text('Successfully deleted.'),
    backgroundColor: Colors.green,
    duration: const Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<Foods>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Dismissible(
        onDismissed: (direction) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          foodData.deleteFood(food.id);
          ScaffoldMessenger.of(context).showSnackBar(_successfullyDeletedSnackbar);
        },
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).errorColor,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
        ),
        child: ListTile(
          onTap: () => Navigator.of(context).pushNamed(FoodDetailsScreen.routeName, arguments: food.id),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(food.imageUrl),
          ),
          title: Text(food.name),
        ),
      ),
    );
  }
}
