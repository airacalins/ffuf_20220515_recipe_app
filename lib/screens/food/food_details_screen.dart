// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';

class FoodDetailsScreen extends StatelessWidget {
  static String routeName = '/food-detail';

  final snackBar = SnackBar(
    content: Text('Successfully added to grocery list'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      onPressed: () {},
      label: 'Undo',
      textColor: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)!.settings.arguments as String;
    final Food food =
        Provider.of<Foods>(context, listen: false).findById(foodId);

    final Groceries groceries = Provider.of<Groceries>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image(
              image: NetworkImage(food.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline2(food.name),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.list_alt,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(food.preparationTime),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.timelapse,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(food.cookingTime),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subtitle1('INGREDIENTS'),
                      IconButton(
                        onPressed: () {
                          groceries.addGroceries(food.ingredients);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart_rounded,
                        ),
                      ),
                    ],
                  ),
                  Divider(),

                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: ListView.builder(
                  //     itemBuilder: (_, index) => Text(food.ingredients[index]),
                  //     itemCount: food.ingredients.length,
                  //   ),
                  // ),
                  Divider(),
                  Subtitle1('INSTRUCTIONS'),

                  // ListView(
                  //   children: food.ingredients.map((f) => Text(f)).toList(),
                  // )
                  // ListView.builder(
                  //   itemBuilder: (context, index) =>
                  //       InstructionItem(food.instructions[index]),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
