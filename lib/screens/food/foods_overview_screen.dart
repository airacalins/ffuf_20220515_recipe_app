// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';

enum FilterOptions {
  All,
  Favorites,
}

class FoodsOverviewScreen extends StatefulWidget {
  static const routeName = '/food/overview';

  @override
  State<FoodsOverviewScreen> createState() => _FoodsOverviewScreenState();
}

class _FoodsOverviewScreenState extends State<FoodsOverviewScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Groceries>(
            builder: (context, groceryData, child) => Badge(
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(GroceriesScreen.routeName),
                icon: Icon(Icons.shopping_basket_outlined),
              ),
              value: "${groceryData.totalItems}",
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavorites = true;
                } else {
                  _showFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('Favorites'),
                value: FilterOptions.Favorites,
              )
            ],
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: Column(
        children: [
          HomeBanner(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FoodGridList(_showFavorites),
            ),
          ),
        ],
      ),
    );
  }
}
