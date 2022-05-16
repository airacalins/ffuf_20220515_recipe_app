// ignore_for_file: prefer_const_constructors

import 'package:ffuf_20220513_recipe_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headline2('Make your own food,'),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Headline2('stay at'),
              HeadlineSecondary2(' home'),
            ],
          ),
        ],
      ),
    );
  }
}
