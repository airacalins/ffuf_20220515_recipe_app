// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        // ignore: prefer_const_constructors
        body: GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(FoodsOverviewScreen.routeName),
      child: SizedBox(
        height: double.infinity,
        child: Image(
          image: AssetImage('assets/images/welcome.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
