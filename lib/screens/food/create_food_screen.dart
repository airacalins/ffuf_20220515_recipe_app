// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/enums/affordability.dart';
import 'package:ffuf_20220513_recipe_app/enums/courses.dart';
import 'package:ffuf_20220513_recipe_app/enums/cuisine.dart';
import 'package:ffuf_20220513_recipe_app/enums/difficulty.dart';
import 'package:ffuf_20220513_recipe_app/forms/form_input.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:flutter/material.dart';

class CreateFoodScreen extends StatefulWidget {
  static const String routeName = '/food/create';

  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _servingFocusNode = FocusNode();
  final _preparationTimeNode = FocusNode();
  final _cookingTimeNode = FocusNode();
  final _ingredientsNode = FocusNode();
  final _prepareIngredients = FocusNode();

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void dispose() {
    _imageUrlController.removeListener(_updateImageUrl);
    _servingFocusNode.dispose();
    _preparationTimeNode.dispose();
    _cookingTimeNode.dispose();
    _ingredientsNode.dispose();
    _prepareIngredients.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  String courseValue = 'Appetizer';
  String cuisineValue = 'Asian';
  String difficultyValue = 'EasyPeasy';
  String affordabilityValue = 'Cheap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
      ),
      body: Form(
        child: ListView(
          children: [
            // IMAGE URL
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  margin: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: FittedBox(
                    child: Image.network(
                      _imageUrlController.text.isEmpty
                          ? 'https://cdn2.vectorstock.com/i/thumb-large/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg'
                          : _imageUrlController.text,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            Divider(),

            FormInput(
              title: 'Title',
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_servingFocusNode),
            ),

            FormInput(
              title: 'Serving',
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_preparationTimeNode),
              keyboardType: TextInputType.number,
            ),

            FormInput(
              title: 'Preparation Time',
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_cookingTimeNode),
            ),

            FormInput(
              title: 'Cooking Time',
              handleFieldSubmitted: () => FocusScope.of(context).requestFocus(),
            ),

            Divider(),

            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(child: Subtitle1('Course')),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: courseValue,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) =>
                            setState(() => courseValue = newValue!),
                        items: Courses.values
                            .map((name) =>
                                name.toString().split('.').elementAt(1))
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Cuisine
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(child: Subtitle1('Cuisine')),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: cuisineValue,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) =>
                            setState(() => cuisineValue = newValue!),
                        items: Cuisine.values
                            .map((name) =>
                                name.toString().split('.').elementAt(1))
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Affordability
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(child: Subtitle1('Affordability')),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: affordabilityValue,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) =>
                            setState(() => affordabilityValue = newValue!),
                        items: Affordability.values
                            .map((name) =>
                                name.toString().split('.').elementAt(1))
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Affordability
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(child: Subtitle1('Difficulty')),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: difficultyValue,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) =>
                            setState(() => difficultyValue = newValue!),
                        items: Difficulty.values
                            .map((name) =>
                                name.toString().split('.').elementAt(1))
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Subtitle1('Ingredients:'),
                ),
                FormInput(
                  title: 'Ex: 1 - Onion',
                  handleFieldSubmitted: () =>
                      FocusScope.of(context).requestFocus(_ingredientsNode),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),

            Divider(),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Subtitle1('Instructions:'),
                ),
                FormInput(
                  title: 'Prepare the ingredients',
                  handleFieldSubmitted: () =>
                      FocusScope.of(context).requestFocus(_ingredientsNode),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add Recipe'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
