import 'package:flutter/material.dart';

class Subtitle1 extends StatelessWidget {
  final String text;

  const Subtitle1(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
