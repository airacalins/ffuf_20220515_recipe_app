// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/screens/screens.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello, Aira!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Recipes Overview'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Recipes'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FoodsScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
