import 'package:ffuf_20220513_recipe_app/providers/groceries.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:flutter/material.dart';

class GroceryItem extends StatelessWidget {
  final Grocery grocery;

  GroceryItem(this.grocery);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.amber,
        child: Subtitle1('${grocery.quantity}'),
      ),
      title: Subtitle1(grocery.name),
    );
  }
}
