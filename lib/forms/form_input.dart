import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  String title;
  Function handleFieldSubmitted;
  TextInputType keyboardType;
  TextEditingController controller;

  FormInput({
    Key? key,
    required this.title,
    required this.handleFieldSubmitted,
    required this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) => handleFieldSubmitted,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: title,
        ),
      ),
    );
  }
}
