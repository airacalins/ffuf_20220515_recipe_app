// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/widgets/headline/headline_1.dart';
import 'package:ffuf_20220513_recipe_app/widgets/instruction/instruction_item.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
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
      appBar: AppBar(
        elevation: 0,
      ),
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
                  Headline5(food.name),
                  Chip(label: Text(food.courseText)),
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
