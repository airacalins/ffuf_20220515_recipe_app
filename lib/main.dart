// ignore_for_file: prefer_const_constructors
import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((_) => Foods())),
        ChangeNotifierProvider(create: ((_) => Groceries())),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  secondary: Colors.white,
                  onSecondary: Colors.amber),
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Colors.white),
          home: FoodsOverviewScreen(),
          routes: {
            FoodDetailsScreen.routeName: (_) => FoodDetailsScreen(),
            GroceriesScreen.routeName: (_) => GroceriesScreen(),
          },
        );
      },
    );
  }
}
