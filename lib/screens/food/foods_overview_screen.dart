// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, constant_identifier_names

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/widgets/badge/badge.dart';
import 'package:flutter/material.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  All,
  Favorites,
}

class FoodsOverviewScreen extends StatefulWidget {
  @override
  State<FoodsOverviewScreen> createState() => _FoodsOverviewScreenState();
}

class _FoodsOverviewScreenState extends State<FoodsOverviewScreen> {
  var _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipe App'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Consumer<Groceries>(
            builder: (context, groceryData, child) => Badge(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_basket_outlined),
              ),
              value: groceryData.totalItems.toString(),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FoodsGrid(_showFavorites),
      ),
    );
    ;
  }
}
