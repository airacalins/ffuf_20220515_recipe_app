// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';

class FoodsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipe App'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(Icons.notifications_none_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FoodsGrid(),
      ),
    );
    ;
  }
}
