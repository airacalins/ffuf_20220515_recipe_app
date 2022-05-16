// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';

class FoodDetailsScreen extends StatelessWidget {
  static String routeName = '/food-detail';

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)!.settings.arguments as String;
    final Food food = Provider.of<Foods>(
      context,
      listen: false,
    ).findById(foodId);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(food.name),
      ),
    );
  }
}
