import 'package:flutter/material.dart';

class BulletItem extends StatelessWidget {
  String text;

  BulletItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.circle,
              size: 10,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Flexible(
            child: Text(
              text,
            ),
          )
        ],
      ),
    );
  }
}
