import 'package:ananix_junior_project/src/manager_state.dart';
import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:ananix_junior_project/src/presentation/provider/button_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => AllUsersProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ButtonSheetProviderAnnaniks(),
      ),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ANManager(),
    );
  }
}
