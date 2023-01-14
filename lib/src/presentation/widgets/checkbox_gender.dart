


import 'package:flutter/material.dart';

import '../../data/constants.dart';
import '../provider/button_sheet_provider.dart';
import 'package:provider/provider.dart';


class MyCheckboxGender extends StatelessWidget {

  Color selectedColor = kGray;

  Color unSelectedColor = kGray;

  MyCheckboxGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonSheetProviderMy>(
        builder: (context, provider, _) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () {
                 provider.isMaleTrue();
                },
                child: Icon(Icons.male),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // <-- Radius
                    ),
                    backgroundColor: provider.isMale ? kPurple : kGray),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    provider.isFemaleTrue();
                  },
                  child: Icon(Icons.female),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // <-- Radius
                      ),
                      backgroundColor: !provider.isMale ? kPurple :kGray),
                ),
              ),
            ],
          );

        });
  }
}
