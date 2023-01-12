import 'package:ananix_junior_project/src/presentation/screens/all_user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/constants.dart';

class ANManager extends StatefulWidget {
  const ANManager({Key? key}) : super(key: key);

  @override
  State<ANManager> createState() => _ANManagerState();
}

class _ANManagerState extends State<ANManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numus',
      // theme: ThemeData(
      //   primarySwatch : kPurple,
      // ),
      home: const AllUserScreen(),

    );
  }
}
