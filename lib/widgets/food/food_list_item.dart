import 'package:flutter/material.dart';
import 'package:ffuf_20220513_recipe_app/models/models.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  const FoodListItem(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
        leading: CircleAvatar(
          backgroundImage: NetworkImage(food.imageUrl),
        ),
        title: Text(food.name),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit,
            size: 20,
          ),
        ),
      ),
    );
  }
}
