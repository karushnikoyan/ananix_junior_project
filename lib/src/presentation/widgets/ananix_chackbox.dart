import 'package:ananix_junior_project/src/data/constants.dart';
import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
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
    AllUsersProvider prv = context.read<AllUsersProvider>();
    return Column(
      children: <Widget>[
        Checkbox(
          activeColor: kPurple,
          value: provider.isChecked,
          onChanged: (bool? value) {
            setState(() {
            provider.setCheck(value);
            });
          },
        ),
      ],
    );
  }
}
