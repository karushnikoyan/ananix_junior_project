import 'package:ananix_junior_project/src/presentation/models/people_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../data/constants.dart';

class ButtonSheetProviderAnnaniks with ChangeNotifier {
  Future<People?> addUser() async {
    People people = People(
        name: nameController.text,
        email: emileController.text,
        gender: gender,
        status: isChecked ? "active" : "inactive");
    var dio = Dio();
    try {
      var result = await dio.post("https://gorest.co.in/public/v2/users",
          options: Options(headers: {"Authorization": "Bearer $accessToken"}),
          data: people.toJson());
      if (result.statusCode == 201) {
        return People.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  late bool isMale = true;


  String gender = "male";
  bool isChecked = false;
  TextEditingController nameController = TextEditingController();

  TextEditingController emileController = TextEditingController();


  bool isCheckedF() {
    isChecked = !isChecked;
    notifyListeners();
    return isChecked;
  }

  setCheck(bool? v) {
    isChecked = v ?? false;
    notifyListeners();
  }

  isMaleTrue() {
    if (isMale != true) {
      isMale = true;
      gender = "male";
      notifyListeners();
    }
  }

  isFemaleTrue() {
    if (isMale == true) {
      isMale = false;
      gender = "female";
      notifyListeners();
    }
  }
}
