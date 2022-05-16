// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/widgets/grocery/grocery_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceriesScreen extends StatelessWidget {
  static String routeName = '/groceries';

  const GroceriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceriesData = Provider.of<Groceries>(context);
    final groceries = groceriesData.groceries;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GroceryItem(groceries[index]),
        itemCount: groceries.length,
      ),
    );
  }
}
