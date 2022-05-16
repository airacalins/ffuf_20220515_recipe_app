import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Image(image: const AssetImage('assets/images/empty-list.png')),
          const SizedBox(
            height: 30,
          ),
          const Headline5('Your cart is empty!'),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Browse Recipes'),
          )
        ],
      ),
    );
  }
}
