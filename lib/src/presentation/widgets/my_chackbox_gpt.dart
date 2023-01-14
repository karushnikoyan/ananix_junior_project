import 'package:ananix_junior_project/src/data/constants.dart';
import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Checkbox(activeColor: kPurple,
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
