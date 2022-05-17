// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/widgets/food/oval_icon_detail.dart';
import 'package:ffuf_20220513_recipe_app/widgets/item/bullet_item.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';

class FoodDetailsScreen extends StatelessWidget {
  static String routeName = '/food/details';

  final snackBar = SnackBar(
    content: Text('Successfully added to grocery list'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      onPressed: () {},
      label: 'UNDO',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(
                    image: NetworkImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Headline2(food.name),
                      Headline5(food.cuisineText),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OvalIconDetail(
                  icon: Icons.access_time,
                  title: '${food.preparationTime} mins.',
                ),
                OvalIconDetail(
                  icon: Icons.outdoor_grill_outlined,
                  title: '${food.cookingTime} mins.',
                ),
                OvalIconDetail(
                    icon: Icons.restaurant, title: "${food.servings} servings"),
                OvalIconDetail(
                  icon: Icons.restart_alt_outlined,
                  title: food.difficultyText,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Subtitle1('Ingredients'),
                      IconButton(
                        onPressed: () {
                          groceries.addGroceries(food.ingredients);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.add_shopping_cart_rounded,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) => BulletItem(food.ingredients[index]),
              itemCount: food.ingredients.length,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Subtitle1('Instructions'),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) => BulletItem(food.instructions[index]),
              itemCount: food.instructions.length,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
