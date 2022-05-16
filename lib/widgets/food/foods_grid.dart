import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodsGrid extends StatelessWidget {
  const FoodsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodsData = Provider.of<Foods>(context);
    final foods = foodsData.foods;

    return GridView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) => FoodItem(foods[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
