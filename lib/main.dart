
import 'package:ananix_junior_project/src/manager_state.dart';
import 'package:ananix_junior_project/src/presentation/screens/screen_selector_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: ANManager(),
    );
  }
}
