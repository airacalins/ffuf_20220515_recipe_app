// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Food App'),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            Icon(Icons.notifications_none_outlined),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            HomeBanner(),
            SizedBox(
              height: 80,
              child: AppBar(
                bottom: TabBar(
                  physics: BouncingScrollPhysics(),
                  unselectedLabelColor: Colors.black38,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.icecream,
                      ),
                      text: 'Dessert',
                    ),
                    Tab(
                      text: 'Rice',
                      icon: Icon(Icons.rice_bowl),
                    ),
                    Tab(
                      text: 'Main Dish',
                      icon: Icon(Icons.room_service),
                    ),
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
