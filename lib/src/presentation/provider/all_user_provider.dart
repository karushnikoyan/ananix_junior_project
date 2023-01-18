import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../data/constants.dart';
import '../models/people_model.dart';

class AllUsersProvider with ChangeNotifier {
  AllUsersProvider() {
    getItems();
    notifyListeners();
  }

  List<People> listPeoples = [];

  People? people;

  Future<dynamic> getItems() async {
    var dio = Dio();

    try {
      final response = await dio.get(
        'https://gorest.co.in/public/v2/users',
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      if (response.statusCode == 200) {
        listPeoples = [];
        (response.data as List)
            .map((e) => listPeoples.add(People.fromJson(e)))
            .toList();
        notifyListeners();
        return listPeoples;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      /// Exception handle
      print(e);
    }
  }

  Future<List<People>> fetchActiveUsers() async {
    List<People> activeUsersList = [];
    Map<String, String> opt = {"status": "active"};

    var dio = Dio();

    try {
      final response = await dio.request(
        'https://gorest.co.in/public/v2/users',
        queryParameters: opt,
        options: Options(
            method: "GET", headers: {"Authorization": "Bearer $accessToken"}),
      );

      if (response.statusCode == 200) {
        activeUsersList = [];
        (response.data as List)
            .map((e) => activeUsersList.add(People.fromJson(e)))
            .toList();

        return activeUsersList;
      }
    } catch (e) {
      /// Exception handle
      print(e);
    }
    return [];
  }

  Future<dynamic> removeUser(int userId) async {
    var dio = Dio();
    try {
      var result = await dio.delete(
        "https://gorest.co.in/public/v2/users/$userId",
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      if (result.statusCode == 204) {
        print("ok");
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic> updateUserData(People user) async {
    if (user.status == "active") {
      user.status = "inactive";
    } else {
      user.status = "active";
    }

    var dio = Dio();
    try {
      var result = await dio.put(
          "https://gorest.co.in/public/v2/users/${user.id}",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: user.toJson());

      if (result.statusCode == 200) {
        print("updated");
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
