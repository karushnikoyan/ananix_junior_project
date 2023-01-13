import 'package:ananix_junior_project/src/manager_state.dart';
import 'package:ananix_junior_project/src/presentation/provider/all_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';


void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => AllUsersProvider(),
      ),
    ], child: MyApp()),

  );

  // var dio = Dio();
  // final response = await dio.get('https://google.com');
  // print(response.data);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ANManager(),
    );
  }
}
