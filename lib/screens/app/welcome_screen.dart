// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:ffuf_20220513_recipe_app/widgets/headline/headline_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(FoodsOverviewScreen.routeName),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                    image: AssetImage('assets/images/welcome.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // child: Image(
              //   image: AssetImage('assets/images/welcome.jpeg'),
              //   fit: BoxFit.cover,
              // ),
            ),
            Positioned.fill(
              top: 100,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Recipe App',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
