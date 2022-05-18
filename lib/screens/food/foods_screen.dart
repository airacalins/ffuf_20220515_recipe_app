// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:ffuf_20220513_recipe_app/widgets/drawer/side_drawer.dart';
import 'package:ffuf_20220513_recipe_app/widgets/food/food_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodsScreen extends StatelessWidget {
  static const String routeName = '/foods';
  const FoodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodsData = Provider.of<Foods>(context);
    final foods = foodsData.foods;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Recipes'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(CreateFoodScreen.routeName),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(itemCount: foods.length, itemBuilder: (_, index) => FoodListItem(foods[index])),
      ),
    );
  }
}
