// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:ffuf_20220513_recipe_app/widgets/subtitle/subtitle_1.dart';
import 'package:flutter/material.dart';

class FromDropDown extends StatefulWidget {
  String title;
  String initialValue;
  List<DropdownMenuItem<String>> dropDownItems;
  Function handleOnChange;

  FromDropDown({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.dropDownItems,
    required this.handleOnChange,
  }) : super(key: key);

  @override
  State<FromDropDown> createState() => _FromDropDownState();
}

class _FromDropDownState extends State<FromDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(child: Subtitle1(widget.title)),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0)),
              child: DropdownButton<String>(
                  isExpanded: true,
                  value: widget.initialValue,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (value) => widget.handleOnChange(value),
                  items: widget.dropDownItems),
            ),
          ),
        ],
      ),
    );
  }
}
