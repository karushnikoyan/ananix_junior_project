import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class AllUsersProvider with ChangeNotifier{


  Future <dynamic> getItems() async {
  var dio = Dio();
  final response = await dio.get('https://gorest.co.in/public/v2/users');
  print(response.data);
  Response response1 = await dio.get("/public/v2/users/315/posts");
notifyListeners();
  }


}