// ignore_for_file: prefer_const_constructors
import 'package:ffuf_20220513_recipe_app/screens/app/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ffuf_20220513_recipe_app/providers/providers.dart';
import 'package:ffuf_20220513_recipe_app/screens/screens.dart';

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
            secondaryHeaderColor: Colors.amber.shade900,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.amber,
              onPrimary: Colors.black,
              secondary: Colors.white,
              onSecondary: Colors.amber,
            ),
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 32.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              headline2: TextStyle(
                fontSize: 24.0,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              headline3: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              headline4: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              headline5: TextStyle(
                fontSize: 13.5,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              bodyText2: TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
              subtitle1: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          home: WelcomeScreen(),
          // initialRoute: '/',
          routes: {
            FoodsOverviewScreen.routeName: (_) => FoodsOverviewScreen(),
            FoodsScreen.routeName: (_) => FoodsScreen(),
            FoodDetailsScreen.routeName: (_) => FoodDetailsScreen(),
            GroceriesScreen.routeName: (_) => GroceriesScreen(),
            CreateFoodScreen.routeName: (_) => CreateFoodScreen(),
          },
        );
      },
    );
  }
}
