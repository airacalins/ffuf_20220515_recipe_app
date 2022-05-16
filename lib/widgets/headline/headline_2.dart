import 'package:flutter/material.dart';

class Headline2 extends StatelessWidget {
  final String child;

  const Headline2(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
