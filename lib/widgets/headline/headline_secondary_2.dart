import 'package:flutter/material.dart';

class HeadlineSecondary2 extends StatelessWidget {
  final String text;
  const HeadlineSecondary2(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headline2!.fontSize,
        fontWeight: Theme.of(context).textTheme.headline4!.fontWeight,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
