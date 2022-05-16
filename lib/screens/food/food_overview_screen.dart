// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:ffuf_20220513_recipe_app/enums/enums.dart';
import 'package:ffuf_20220513_recipe_app/models/food.dart';
import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FoodOverviewScreen extends StatelessWidget {
  final List<Food> foods = [
    Food(
      id: 'f1',
      name: 'Smoked Salmon',
      imageUrl:
          'https://images.pexels.com/photos/9671541/pexels-photo-9671541.png?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      course: Courses.MainDish,
      cuisineId: 's7',
      difficulty: Difficulty.Challenging,
      affordability: Affordability.Expensive,
      preparationTime: '25 minutes',
      cookingTime: '10 minutes',
      servings: 3,
      isFavorite: false,
      ingredients: [
        '1/2 teaspoon pepper',
        '1 to 2 tablespoons liquid smoke',
        'Optional: Capers and lemon slices',
        '1 salmon fillet (about 2 pounds)',
        '2 tablespoons brown sugar',
        '2 teaspoons salt'
      ],
      instructions: [
        'Place salmon, skin side down, in an 11x7-in. baking pan coated with cooking spray. Sprinkle with brown sugar, salt and pepper. Drizzle with liquid smoke. Cover and refrigerate for 4-8 hours.',
        'Drain salmon, discarding liquid. Bake, uncovered, at 350° until fish flakes easily with a fork, 35-45 minutes. Cool to room temperature. Cover and refrigerate for 8 hours or overnight. If desired, serve with capers and lemon slices.'
      ],
    ),
    Food(
      id: 'f2',
      name: 'Sinigang',
      imageUrl:
          'https://panlasangpinoy.com/wp-content/uploads/2018/11/Sinigang-na-Baboy-Recipe.jpg',
      course: Courses.MainDish,
      cuisineId: 's6',
      difficulty: Difficulty.EasyPeasy,
      affordability: Affordability.Pricey,
      preparationTime: '30 minutes',
      cookingTime: '10 minutes',
      servings: 6,
      isFavorite: false,
      ingredients: [
        '2 lbs pork belly or buto-buto',
        '1 bunch spinach or kang-kong',
        '3 tablespoons fish sauce',
        '12 pieces string beans sitaw, cut in 2 inch length',
        '2 pieces tomato quartered',
        '3 pieces chili or banana pepper',
        '1 tablespoons cooking oil',
        '2 quarts water',
        '1 piece onion sliced',
        '2 pieces taro gabi, quartered',
        '1 pack sinigang mix good for 2 liters wat'
      ],
      instructions: [
        'Heat the pot and put-in the cooking oil',
        'Sauté the onion until its layers separate from each other',
        'Add the pork belly and cook until outer part turns light brown',
        'Put-in the fish sauce and mix with the ingredients',
        'Pour the water and bring to a boil',
        'Add the taro and tomatoes then simmer for 40 minutes or until pork is tender',
        'Put-in the sinigang mix and chili',
        'Add the string beans (and other vegetables if there are any) and simmer for 5 to 8 minutes',
        'Put-in the spinach, turn off the heat, and cover the pot. Let the spinach cook using the remaining heat in the pot.',
        'Serve hot. Share and enjoy!'
      ],
    ),
    Food(
      id: 'f3',
      name: 'Pad Thai',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/18/06/36/egg-net-3545650_1280.jpg',
      course: Courses.MainDish,
      cuisineId: 's13',
      difficulty: Difficulty.Challenging,
      affordability: Affordability.Pricey,
      preparationTime: '20 minutes',
      cookingTime: '10 minutes',
      servings: 2,
      isFavorite: true,
      ingredients: [
        '125 g / 4oz Chang’s Pad Thai dried rice sticks (Note 1)',
        '1 1/2 tbsp tamarind puree (Note 2)',
        '3 tbsp (packed) brown sugar',
        '2 tbsp fish sauce (Note 3)',
        '1 1/2 tbsp oyster sauce (Note 4)',
        '2 – 3 tbsp vegetable or canola oil',
        '1/2 onion , sliced (brown, yellow)',
        '2 garlic cloves , finely chopped',
        '150 g/5oz chicken breast (or thigh) , thinly sliced',
        '2 eggs , lightly whisked',
        '1 1/2 cups of beansprouts',
        '1/2 cup firm tofu, cut into 3cm / 1 1/4″ batons (see photo)',
        '1/4 cup garlic chives , cut into 3cm / 1 1/4″ pieces',
        '1/4 cup finely chopped peanuts',
        'Lime wedges (essential)',
        'Ground chilli or cayenne pepper (optional)',
        'More beansprouts'
      ],
      instructions: [
        'Place noodles in a large bowl, pour over plenty of boiling water. Soak for 5 minutes, then drain in a colander and quickly rinse under cold water. Don’t leave them sitting around for more than 5 – 10 minutes.',
        'Mix Sauce in small bowl.',
        'Heat 2 tbsp oil in a large non stick pan (or well seasoned skillet) over high heat. Add garlic and onion, cook for 30 seconds.',
        'Add chicken and cook for 1 1/2 minutes until mostly cooked through.',
        'Push to one side of the pan, pour egg in on the other side. Scramble using the wooden spoon (add touch of extra oil if pan is too dry), then mix into chicken.',
        'Add bean sprouts, tofu, noodles then Sauce.',
        'Toss gently for about 1 1/2 minutes until Sauce is absorbed by the noodles.',
        'Add garlic chives and half the peanuts. Toss through quickly then remove from heat.',
        'Serve immediately, sprinkled with remaining peanuts and lime wedges on the side, with a sprinkle of chilli and a handful of extra beansprouts on the side if desired (this is the Thai way!). Squeeze over lime juice to taste before eating.'
      ],
    )
  ];

  // const FoodOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Recipe App'),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Icon(Icons.notifications_none_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) => FoodItem(foods[index]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
    ;
  }
}
