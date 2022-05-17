// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:ffuf_20220513_recipe_app/enums/affordability.dart';
import 'package:ffuf_20220513_recipe_app/enums/courses.dart';
import 'package:ffuf_20220513_recipe_app/enums/cuisine.dart';
import 'package:ffuf_20220513_recipe_app/enums/difficulty.dart';
import 'package:ffuf_20220513_recipe_app/forms/form_dropdown.dart';
import 'package:ffuf_20220513_recipe_app/forms/form_image_input.dart';
import 'package:ffuf_20220513_recipe_app/forms/form_input.dart';
import 'package:ffuf_20220513_recipe_app/models/models.dart';
import 'package:ffuf_20220513_recipe_app/widgets/headline/headline_5.dart';
import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class CreateFoodScreen extends StatefulWidget {
  static const String routeName = '/food/create';

  const CreateFoodScreen({Key? key}) : super(key: key);

  @override
  State<CreateFoodScreen> createState() => _CreateFoodScreenState();
}

class _CreateFoodScreenState extends State<CreateFoodScreen> {
  final List<String> _ingredients = List.empty(growable: true);
  final List<String> _instructions = List.empty(growable: true);

  final _imageUrlController = TextEditingController();
  final _titleController = TextEditingController();
  final _servingController = TextEditingController();
  final _preparationTimeController = TextEditingController();
  final _cookingTimeController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionController = TextEditingController();

  final _imageUrlFocusNode = FocusNode();
  final _servingFocusNode = FocusNode();
  final _preparationTimeNode = FocusNode();
  final _cookingTimeNode = FocusNode();
  final _ingredientsNode = FocusNode();
  final _prepareIngredients = FocusNode();
  final _formKey = GlobalKey<FormState>();

  var _newRecipe = Food(
    id: '',
    name: '',
    imageUrl: '',
    course: Courses.Appetizer,
    cuisine: Cuisine.Asian,
    difficulty: Difficulty.EasyPeasy,
    affordability: Affordability.Cheap,
    preparationTime: 0,
    cookingTime: 0,
    servings: 0,
    ingredients: [],
    instructions: [],
  );

  SnackBar _successfullyDeletedSnackbar = SnackBar(
    content: Text('Successfully deleted.'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
  );

  SnackBar _successfullyAddedSnackbar = SnackBar(
    content: Text('Successfully added a recipe.'),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImageUrl);
    _servingFocusNode.dispose();
    _preparationTimeNode.dispose();
    _cookingTimeNode.dispose();
    _ingredientsNode.dispose();
    _prepareIngredients.dispose();
    _imageUrlController.text = "";
    _titleController.text = "";
    _servingController.text = "";
    _preparationTimeController.text = "";
    _cookingTimeController.text = "";
    _ingredientsController.text = "";
    _instructionController.text = "";
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

  void _handleCourseChange(String newValue) {
    setState(() => courseValue = newValue);
  }

  void _handleCuisineChange(String newValue) {
    setState(() => cuisineValue = newValue);
  }

  void _handleAffordabilityChange(String newValue) {
    setState(() => affordabilityValue = newValue);
  }

  void _handleDifficultyChange(String newValue) {
    setState(() => difficultyValue = newValue);
  }

  void _handleAddingIngredients() {
    setState(() {
      if (_ingredientsController.text.isNotEmpty) {
        if (!_ingredients.any((element) =>
            element.toLowerCase() ==
            _ingredientsController.text.toLowerCase())) {
          _ingredients.add(_ingredientsController.text);
          _ingredientsController.text = "";
        }
      }
    });
  }

  void _handleAddingInstructions() {
    setState(() {
      if (_instructionController.text.isNotEmpty) {
        if (!_instructions.any((element) =>
            element.toLowerCase() ==
            _instructionController.text.toLowerCase())) {
          _instructions.add(_instructionController.text);
          _instructionController.text = "";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodsData = Provider.of<Foods>(context);

    void _handleSubmit() {
      final newRecipe = Food(
        id: DateTime.now().toString(),
        name: _titleController.text,
        imageUrl: _imageUrlController.text,
        course: Courses.values.byName(courseValue),
        cuisine: Cuisine.values.byName(cuisineValue),
        difficulty: Difficulty.values.byName(difficultyValue),
        affordability: Affordability.values.byName(affordabilityValue),
        preparationTime: int.parse(_preparationTimeController.text),
        cookingTime: int.parse(_cookingTimeController.text),
        servings: int.parse(_servingController.text),
        ingredients: _ingredients,
        instructions: _instructions,
      );

      foodsData.createFood(newRecipe);
      Navigator.of(context).pushNamed('/');

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(_successfullyAddedSnackbar);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Recipe'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            FormImageInput(
              title: 'Image URL',
              controller: _imageUrlController,
              imageUrl: _imageUrlController.text.isEmpty
                  ? 'https://cdn2.vectorstock.com/i/thumb-large/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg'
                  : _imageUrlController.text,
            ),
            Divider(),
            FormInput(
              title: 'Title',
              controller: _titleController,
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_servingFocusNode),
            ),
            FormInput(
              title: 'Serving',
              controller: _servingController,
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_preparationTimeNode),
              keyboardType: TextInputType.number,
            ),
            FormInput(
              title: 'Preparation Time',
              controller: _preparationTimeController,
              handleFieldSubmitted: () =>
                  FocusScope.of(context).requestFocus(_cookingTimeNode),
              keyboardType: TextInputType.number,
            ),
            FormInput(
              controller: _cookingTimeController,
              title: 'Cooking Time',
              handleFieldSubmitted: () => FocusScope.of(context).requestFocus(),
              keyboardType: TextInputType.number,
            ),
            Divider(),
            FromDropDown(
              title: 'Course',
              initialValue: courseValue,
              dropDownItems: Courses.values
                  .map((name) => name.toString().split('.').elementAt(1))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              handleOnChange: _handleCourseChange,
            ),
            FromDropDown(
              title: 'Cuisine',
              initialValue: cuisineValue,
              dropDownItems: Cuisine.values
                  .map((name) => name.toString().split('.').elementAt(1))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              handleOnChange: _handleCuisineChange,
            ),
            FromDropDown(
              title: 'Affordability',
              initialValue: affordabilityValue,
              dropDownItems: Affordability.values
                  .map((name) => name.toString().split('.').elementAt(1))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              handleOnChange: _handleAffordabilityChange,
            ),
            FromDropDown(
              title: 'Difficulty',
              initialValue: difficultyValue,
              dropDownItems: Difficulty.values
                  .map((name) => name.toString().split('.').elementAt(1))
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              handleOnChange: _handleDifficultyChange,
            ),
            Divider(),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Subtitle1('Ingredients:'),
                    ),
                    Column(
                      children: _ingredients
                          .map(
                            (ingredient) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Headline5(ingredient),
                                  IconButton(
                                    onPressed: () => setState(
                                      () {
                                        _ingredients.remove(ingredient);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                _successfullyDeletedSnackbar);
                                      },
                                    ),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    FormInput(
                      title: 'Ingredient',
                      handleFieldSubmitted: () =>
                          FocusScope.of(context).requestFocus(_ingredientsNode),
                      controller: _ingredientsController,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _handleAddingIngredients,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Subtitle1('Instructions:'),
                    ),
                    Column(
                      children: _instructions
                          .map(
                            (instruction) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Headline5(instruction),
                                  IconButton(
                                    onPressed: () => setState(
                                      () {
                                        _instructions.remove(instruction);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                _successfullyDeletedSnackbar);
                                      },
                                    ),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    FormInput(
                      title: 'Instruction',
                      handleFieldSubmitted: () =>
                          FocusScope.of(context).requestFocus(_ingredientsNode),
                      controller: _instructionController,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _handleAddingInstructions,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Add Recipe'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
