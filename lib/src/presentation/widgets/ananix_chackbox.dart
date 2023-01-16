import 'package:ananix_junior_project/src/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/button_sheet_provider.dart';

class AnnaniksCheckbox extends StatefulWidget {
  const AnnaniksCheckbox({super.key});

  @override
  State<AnnaniksCheckbox> createState() => _AnnaniksCheckboxState();
}

class _AnnaniksCheckboxState extends State<AnnaniksCheckbox> {

  @override
  Widget build(BuildContext context) {
    ButtonSheetProviderAnnaniks provider = context.read<ButtonSheetProviderAnnaniks>();
    return Column(
      children: <Widget>[
        Checkbox(

          activeColor: kPurple,
          value: provider.isChecked,
          onChanged: (bool? value) {

            provider.setCheck(value);
          },
        ),
      ],
    );
  }
}
