// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreateFoodScreen extends StatefulWidget {
  static const String routeName = '/food/create';

  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
      ),
      body: Center(
        child: Text('Create Food Screen'),
      ),
    );
  }
}
