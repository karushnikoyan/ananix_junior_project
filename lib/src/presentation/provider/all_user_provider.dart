import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../models/people_model.dart';

class AllUsersProvider with ChangeNotifier{


//   Future <dynamic> getItems() async {
//   var dio = Dio();
//   final response = await dio.get('https://gorest.co.in/public/v2/users');
//   print(response.data);
//   People
// notifyListeners();
//   }

  Future <dynamic> getItems() async {
    var dio = Dio();
    final response = await dio.get('https://gorest.co.in/public/v2/users');
    print(response.data);
    People.fromJson(response.data);
    notifyListeners();
  }




}