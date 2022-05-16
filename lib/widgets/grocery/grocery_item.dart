// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/providers/groceries.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryItem extends StatelessWidget {
  final Grocery grocery;

  GroceryItem(this.grocery, {Key? key}) : super(key: key);

  // final snackBar = SnackBar(
  //   content: Text('Successfully removed.'),
  //   backgroundColor: Colors.green,
  //   duration: Duration(seconds: 2),
  //   action: SnackBarAction(
  //     onPressed: () {
  //       Provider.of<Groceries>(context, listen: false).removeGrocery(grocery);
  //     },
  //     label: 'Undo',
  //     textColor: Colors.white,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Groceries>(context, listen: false).removeGrocery(grocery);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully removed.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              onPressed: () {
                Provider.of<Groceries>(context, listen: false).undo();
              },
              label: 'Undo',
              textColor: Colors.white,
            ),
          ),
        );
      },
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: ListTile(
        leading: Chip(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          label: Subtitle1('${grocery.quantity}'),
        ),
        title: Subtitle1(grocery.name),
      ),
    );
  }
}
