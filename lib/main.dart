// ignore_for_file: prefer_const_constructors
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ffuf_20220513_recipe_app/screens/food/food_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          onPrimary: Colors.amber.shade900,
          // secondary: Colors.amber.shade900,
        ),
        fontFamily: 'Poppins',
      ),
      home: FoodOverviewScreen(),
      routes: {FoodDetailsScreen.routeName: (ctx) => FoodDetailsScreen()},
    );
  }
}
