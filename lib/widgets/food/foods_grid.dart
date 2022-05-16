import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodsGrid extends StatelessWidget {
  final bool showFavorites;
  const FoodsGrid(
    this.showFavorites, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodsData = Provider.of<Foods>(context);
    final foods = showFavorites ? foodsData.favoriteFoods : foodsData.foods;

    return GridView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: foods[index],
        builder: (context, child) => FoodItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
