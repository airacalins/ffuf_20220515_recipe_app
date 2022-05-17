import 'package:flutter/material.dart';

class FormImageInput extends StatelessWidget {
  String title;
  TextEditingController controller;
  String imageUrl;

  FormImageInput(
      {Key? key,
      required this.title,
      required this.controller,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: title,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.done,
              controller: controller,
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
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
