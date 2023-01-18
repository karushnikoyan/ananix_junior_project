import 'package:ananix_junior_project/src/presentation/screens/screen_selector_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: const ScreenSelectorManager(),
    );
  }
}
