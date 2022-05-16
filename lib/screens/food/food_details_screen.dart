// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatelessWidget {
  static String routeName = '/food-detail';

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Food Details Screen'),
      ),
    );
  }
}
