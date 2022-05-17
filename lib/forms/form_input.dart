import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  String title;
  Function handleFieldSubmitted;
  TextInputType keyboardType;

  FormInput({
    Key? key,
    required this.title,
    required this.handleFieldSubmitted,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: title,
        ),
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) => handleFieldSubmitted,
      ),
    );
  }
}
